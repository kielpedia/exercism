 (ns grains)

 (defn two-to-the-power [exponent]
   (.pow (BigInteger. "2") exponent))

 (defn square [number]
       (two-to-the-power (dec number)))

 (defn total []
       (dec (two-to-the-power 64)))
