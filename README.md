# Fold

See entries for [Fold](http://mlton.org/Fold) and
[Fold01N](http://mlton.org/Fold01N) on the Mlton wiki for a tutorial.


## Overview of MLB files

- `lib/github.com/pzel/fold/fold.mlb`

  - **signature** [`FOLD`](lib/github.com/pzel/fold/fold.sig)
  - **structure** `Fold` :> `FOLD`

- `lib/github.com/pzel/fold/fold01.mlb`

  - **signature** [`FOLD_01N`](lib/github.com/pzel/fold/fold01n.sig)
  - **structure** `Fold01N` :> `FOLD_01N`



```sml
signature FOLD =
   sig
      type ('a, 'b, 'c, 'd) step = 'a * ('b -> 'c) -> 'd
      type ('a, 'b, 'c, 'd) t = ('a, 'b, 'c, 'd) step -> 'd
      type ('a1, 'a2, 'b, 'c, 'd) step0 =
         ('a1, 'b, 'c, ('a2, 'b, 'c, 'd) t) step
      type ('a11, 'a12, 'a2, 'b, 'c, 'd) step1 =
         ('a12, 'b, 'c, 'a11 -> ('a2, 'b, 'c, 'd) t) step

      val fold: 'a * ('b -> 'c) -> ('a, 'b, 'c, 'd) t
      val lift0: ('a1, 'a2, 'a2, 'a2, 'a2) step0
                 -> ('a1, 'a2, 'b, 'c, 'd) step0
      val post: ('a, 'b, 'c1, 'd) t * ('c1 -> 'c2)
                -> ('a, 'b, 'c2, 'd) t
      val step0: ('a1 -> 'a2) -> ('a1, 'a2, 'b, 'c, 'd) step0
      val step1: ('a11 * 'a12 -> 'a2)
                 -> ('a11, 'a12, 'a2, 'b, 'c, 'd) step1
   end
```


```sml
signature FOLD_01N =
   sig
      type ('a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j) t =
         ('a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j) Fold01N.t
      type ('a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j) step0 =
         ('a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j) Fold01N.step0
      type ('a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j) step1 =
         ('a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j) Fold01N.step1

      val fold:
         {finish: 'accum2 -> 'answer,
          start: 'input -> 'accum1,
          zero: 'zero}
         -> ('input, 'accum1, 'accum2, 'answer, 'zero,
             'a, 'b, 'c, 'd, 'e) t

      val step0:
         {combine: 'accum1 * 'input2 -> 'accum2,
          input: 'input1}
         -> ('input1, 'accum1, 'input2, 'accum2,
             'a, 'b, 'c, 'd, 'e, 'f) step0

      val step1:
         {combine: 'accum1 * 'input -> 'accum2}
         -> ('accum1, 'input, 'accum2,
             'a, 'b, 'c, 'd, 'e, 'f, 'g) step1
   end
```


