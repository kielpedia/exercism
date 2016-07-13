(ns phone-number
    (:require [clojure.string :refer [replace starts-with?]]))

(def invalid-number "0000000000")

(defn- replace-invalid [phone-number]
       (cond (or
               (<= (count phone-number) 9)
               (> (count phone-number) 11)) invalid-number
             (= (count phone-number) 11)
             (if (starts-with? phone-number "1")
               (subs phone-number 1)
               invalid-number)
             :else phone-number))

(defn clean-number [phone-number]
      (->
        (replace phone-number #"[^\d]" "")
        (replace-invalid)))

(defn number [phone-number]
      (clean-number phone-number))

(defn area-code [phone-number]
      (->
        (clean-number phone-number)
        (subs 0 3)))

(defn pretty-print [phone-number]
      (let [cleaned-number (clean-number phone-number)]
           (format "(%s) %s-%s"
                   (area-code cleaned-number)
                   (subs cleaned-number 3 6)
                   (subs cleaned-number 6))))