(ns anagram
    (:require [clojure.string :as string]))

(defn character-count [s]
      (-> s
          string/lower-case
          char-array
          seq
          frequencies))

(defn anagrams-for [target wordlist]
      (let [tChars (character-count target)
            filters [#(not (.equalsIgnoreCase % target)) #(.equals (character-count %) tChars)]]
           (filter (apply every-pred filters) wordlist)))
