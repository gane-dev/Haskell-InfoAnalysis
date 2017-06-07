module Main
    ( main
    ) where

    import OpenData
    import qualified Control.Monad as Monad
    import qualified System.Exit as Exit

    main :: IO ()
    main = do
      putStrLn "Open data!"

      eitherCountryItems <-
        fmap filterCountryItems
        <$> decodeItemsFromFile "items.csv"

      case eitherCountryItems of
        Left reason ->
          Exit.die reason
        Right countryItems -> do
          putStr "Number of country items: "
          print (length countryItems)
