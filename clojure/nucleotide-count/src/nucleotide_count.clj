 (ns nucleotide-count)

 (def nucleotides #{\A \T \C \G})

 (defn count [nucleotide text]
       (if (contains? nucleotides nucleotide)
         (frequencies nucleotide text)
         (throw Throwable))
         )

 (defn nucleotide-counts [text]
       (let [counts (map #(count % text) nucleotides)]
            (zipmap nucleotides counts)))
