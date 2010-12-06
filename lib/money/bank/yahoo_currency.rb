require 'money'
require 'open-uri'

class Money
  module Bank
    class YahooCurrency < Money::Bank::VariableExchange
      # @return [Hash] Stores the currently known rates.
      attr_reader :rates

      ##
      # Clears all rates stored in @rates
      #
      # @return [Hash] The empty @rates Hash.
      #
      # @example
      #   @bank = YahooCurrency.new  #=> <Money::Bank::YahooCurrency...>
      #   @bank.get_rate(:USD, :EUR)  #=> 0.776337241
      #   @bank.flush_rates           #=> {}
      def flush_rates
        @mutex.synchronize{
          @rates = {}
        }
      end

      ##
      # Clears the specified rate stored in @rates.
      #
      # @param [String, Symbol, Currency] from Currency to convert from (used
      #   for key into @rates).
      # @param [String, Symbol, Currency] to Currency to convert to (used for
      #   key into @rates).
      #
      # @return [Float] The flushed rate.
      #
      # @example
      #   @bank = YahooCurrency.new #=> <Money::Bank::YahooCurrency...>
      #   @bank.get_rate(:USD, :EUR) #=> 0.776337241
      #   @bank.flush_rate(:USD, :EUR) #=> 0.776337241
      def flush_rate(from, to)
        key = rate_key_for(from, to)
        @mutex.synchronize{
          @rates.delete(key)
        }
      end

      ##
      # Returns the requested rate from @rates if it exists, otherwise calls
      # +#get_yahoo_rate+.
      #
      # @param [String, Symbol, Currency] from Currency to convert from
      # @param [String, Symbol, Currency] to Currency to convert to
      #
      # @return [Float] The requested rate.
      #
      # @example
      #   @bank = YahooCurrency.new #=> <Money::Bank::YahooCurrency...>
      #   @bank.get_rate(:USD, :EUR) #=> 0.776337241
      def get_rate(from, to)
        @mutex.synchronize{
          @rates[rate_key_for(from, to)] ||= get_yahoo_rate(from, to)
        }
      end

      ##
      # Returns the requested rate after querying Yahoo! Finance.
      #
      #
      # @param [String, Symbol, Currency] from Currency to convert from
      # @param [String, Symbol, Currency] to Currency to convert to
      #
      # @return [Float] The requested rate.
      #
      # @example
      #   @bank = YahooCurrency.new #=> <Money::Bank::YahooCurrency...>
      #   @bank.get_yahoo_rate(:USD, :EUR) #=> 0.776337241
      def get_yahoo_rate(from, to)
        from, to = Currency.wrap(from), Currency.wrap(to)

        if from.iso_code == to.iso_code
          return 1.0
        else
          url = "http://download.finance.yahoo.com/d/quotes.csv?s=#{from.iso_code}#{to.iso_code}=X&f=l1"
          data = URI.parse(url).read.to_f
          if data.zero? or to.iso_code == "ALL"
            raise UnknownRate
          else
            return data
          end
        end
      end
    end
  end
end
