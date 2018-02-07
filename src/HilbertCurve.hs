module HilbertCurve (xy2d, d2xy) where

import Data.Bits ((.&.), xor)

xy2d :: Int -> Int -> Int -> Maybe Int
xy2d n x y
    | n < 1 || x >= n || y >= n || x < 0 || y < 0 = Nothing
    | otherwise =
        let d = 0
            s = n `quot` 2
        in Just $ xy2dHelper x y s d

boolToCInt True = 1
boolToCInt False = 0

xy2dHelper :: Int -> Int -> Int -> Int -> Int
xy2dHelper x y s d
    | s <= 0 = 0
    | otherwise = 
        let rx = boolToCInt $ x .&. s > 0
            ry = boolToCInt $ y .&. s > 0
            d' = d + s * s * ((3 * rx) `xor` ry)
            result = rot s x y rx ry
            s' = s `quot` 2
         in d' + case result of Just (x', y') -> xy2dHelper x' y' s' d'
                                Nothing -> xy2dHelper x y s' d'

d2xy :: Int -> Int -> Maybe (Int, Int)
d2xy n d
    | n < 1 || d < 0 || d >= n * n = Nothing
    | otherwise = 
        let x = 0
            y = 0
        in Just $ d2xyHelper 1 n d x y

d2xyHelper :: Int -> Int -> Int -> Int -> Int -> (Int, Int)
d2xyHelper s n t x y
    | s >= n = (x,y)
    | otherwise = 
        let rx = (.&.) 1 $ t `quot` 2
            ry  = (.&.) 1 $ t `xor` rx
            result = case rot s x y rx ry of Just (x', y') -> (x' + s*rx, y' + s*ry)
                                             Nothing -> (x + s*rx, y + s*ry)
            t' = t `quot` 4
            s' = s * 2
        in case result of (x', y') -> d2xyHelper s' n t' x' y'

rot :: Int -> Int -> Int -> Int -> Int -> Maybe (Int, Int)
rot n x y rx ry 
    | ry == 0 = 
        let result
             | rx == 0 = (n-1-y, n-1-x)
             | otherwise = (y,x)
        in Just result
    | otherwise = Nothing
