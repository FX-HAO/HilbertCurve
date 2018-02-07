# HilbertCurve

This is a Hilbert curve implementation in Haskell.

A [Hilbert curve](https://en.wikipedia.org/wiki/Hilbert_curve) (also known as a Hilbert space-filling curve) is a continuous fractal space-filling curve, which is a curve whose range contains the entire 2-dimensional unit square.

## Running the tests

To run the test suite, execute the following command:

```bash
stack setup && stack test
```

## Usage

```haskell
ghci> :l src/HilbertCurve.hs
[1 of 1] Compiling HilbertCurve     ( src/HilbertCurve.hs, interpreted )
Ok, modules loaded: HilbertCurve.
ghci> xy2d 2 1 1
2
ghci> d2xy 2 2
Just (1,1)
```
