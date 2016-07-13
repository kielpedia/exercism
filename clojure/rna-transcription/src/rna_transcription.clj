(ns rna-transcription
    (:require [clojure.string :refer [replace]]))

(defn to-rna [dna]
      (if (re-find #"![GCTAU]" dna) throw AssertionError))