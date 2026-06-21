structure Fold01N: FOLD_01N =
   struct
      open Fold01N

      fun fold {finish, start, zero} =
         Fold.fold ((id, finish, fn () => zero, start),
                    fn (finish, _, p, _) => finish (p ()))

      fun step0 {combine, input} =
         Fold.step0 (fn (_, finish, _, f) =>
                     (finish,
                      finish,
                      fn () => f input,
                      fn x' => combine (f input, x')))

      fun step1 {combine} z input =
         step0 {combine = combine, input = input} z
   end
