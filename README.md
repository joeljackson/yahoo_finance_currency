Yahoo Currency
===============

This gem extends Money::Bank::VariableExchange with Money::Bank::YahooCurrency
and gives you access to the current Yahoo! Finance exchange rates.

Usage
-----

    require 'money'
    require 'money/bank/yahoo_currency'

    # set default bank to instance of YahooCurrency
    Money.default_bank = Money::Bank::YahooCurrency.new

    # create a new money object, and use the standard #exchange_to method
    n = 1.to_money(:USD)
    n.exchange_to(:EUR)

An `UnknownRate` will be thrown if `#exchange_to` is called with a `Currency`
that `Money` knows, but Yahoo! Finance does not.

An `UnknownCurrency` will be thrown if `#exchange_to` is called with a
`Currency` that `Money` does not know.

Copyright
---------

See {file:LICENSE} for details.
