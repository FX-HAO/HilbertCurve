module HilbertCurveSpec (main, spec) where

import Test.Hspec        (Spec, describe, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspec)

import HilbertCurve (xy2d, d2xy)

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "xy2d" $ do
    it "n=2 (0,0)" $ do
      xy2d n 0 0 `shouldBe` 0
    it "n=2 (0,1)" $ do
      xy2d n 0 1 `shouldBe` 1
    it "n=2 (1,1)" $ do
      xy2d n 1 1 `shouldBe` 2
    it "n=2 (1,0)" $ do
      xy2d n 1 0 `shouldBe` 3
  
  describe "d2xy" $ do
    it "n=2 d=0" $ do
      d2xy n 0 `shouldBe` Just (0,0)
    it "n=2 d=1" $ do
      d2xy n 1 `shouldBe` Just (0,1)
    it "n=2 d=2" $ do
      d2xy n 2 `shouldBe` Just (1,1)
    it "n=2 d=3" $ do
      d2xy n 3 `shouldBe` Just (1,0)
  
  where n = 2
