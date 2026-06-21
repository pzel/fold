structure Fold01N =
   struct
      type ('input, 'accum1, 'accum2, 'answer, 'zero,
            'a, 'b, 'c, 'd, 'e) t =
         (('zero -> 'zero)
          * ('accum2 -> 'answer)
          * (unit -> 'zero)
          * ('input -> 'accum1),
          ('a -> 'b) * 'c * (unit -> 'a) * 'd,
          'b,
          'e) Fold.t

       type ('input1, 'accum1, 'input2, 'accum2,
            'a, 'b, 'c, 'd, 'e, 'f) step0 =
         ('a * 'b * 'c * ('input1 -> 'accum1),
          'b * 'b * (unit -> 'accum1) * ('input2 -> 'accum2),
          'd, 'e, 'f) Fold.step0

      type ('accum1, 'input, 'accum2,
            'a, 'b, 'c, 'd, 'e, 'f, 'g) step1 =
         ('a,
          'b * 'c * 'd * ('a -> 'accum1),
          'c * 'c * (unit -> 'accum1) * ('input -> 'accum2),
          'e, 'f, 'g) Fold.step1
   end

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

