; ===================================================
; File: tubes-2.CLP
; Description: Breast cancer detector
; ===================================================

(defrule start
=>
(assert (phase start))
)

(defrule enter-message
?phase <- (phase start)
=>
    (retract ?phase)
    (printout t crlf "Mean concave points: ")
    (assert (mean-concave-points  (read)))
    (printout t crlf "Worst concave points: ")
    (assert (worst-concave-points (read)))
    (printout t crlf "Concave points error: ")
    (assert (concave-points-error (read)))
    (printout t crlf "Mean radius: ")
    (assert (mean-radius (read)))
    (printout t crlf "Worst radius: ")
    (assert (worst-radius (read)))
    (printout t crlf "Radius error: ")
    (assert (radius-error (read)))
    (printout t crlf "Mean texture: ")
    (assert (mean-texture (read)))
    (printout t crlf "Worst texture: ")
    (assert (worst-texture (read)))
    (printout t crlf "Worst area: ")
    (assert (worst-area (read)))
    (printout t crlf "Mean smoothness: ")
    (assert (mean-smoothness (read)))
    (printout t crlf "Worst perimeter: ")
    (assert (worst-perimeter (read)))
    (printout t crlf "Perimeter error: ")
    (assert (perimeter-error (read)))
)

(defrule rule11-a
?mean-concave-points (mean-concave-points > 0.05)
?worst-perimeter (worst-perimeter <= 114.45)
=>
    (printout t crlf "Worse-texture: ")
    (assert (worse-texture (read)))
)

(defrule rule11-b
?mean-concave-points (mean-concave-points > 0.05)
?worst-perimeter (worst-perimeter > 114.45)
=>
    (assert (result 0))
)

(defrule rule12-a
?worst-perimeter (worst-perimeter <= 114.45)
?worse-texture (worse-texture <= 25.65)
=>
    (printout t crlf "Worse-concave-points: ")
    (assert (worse-concave-points (read)))
)

(defrule rule12-b
?worst-perimeter (worst-perimeter <= 114.45)
?worse-texture (worse-texture > 25.65)
=>
    (printout t crlf "perimeter-error: ")
    (assert (perimeter-error (read)))
)

(defrule rule13-a
?worse-texture (worse-texture <= 25.65)
?worse-concave-points (worse-concave-points <= 0.17)
=>
    (assert (result 1))
)

(defrule rule13-b
?worse-texture (worse-texture <= 25.65)
?worse-concave-points (worse-concave-points > 0.17)
=>
    (assert (result 0))
)


(defrule rule14-a
?worse-texture (worse-texture > 25.65)
?perimeter-error <- (perimeter-error <= 1.56)
=>
    (printout t crlf "Mean-radius: ")
    (assert (mean-radius (read)))
)

(defrule rule14-b
?worse-texture (worse-texture > 25.65)
?perimeter-error <- (perimeter-error > 1.56)
=>
    (assert (result 0))
)

(defrule rule15-a
?perimeter-error <- (perimeter-error <= 1.56)
?mean-radius <- (mean-radius <= 13.34 )
=>
    (assert (result 0))
)

(defrule rule15-b
?perimeter-error <- (perimeter-error <= 1.56)
?mean-radius <- (mean-radius > 13.34 )
=>
    (assert (result 1))
)

(defrule positive-cancer
?result <- (result 1)
=>
(retract ?result)
(printout t "Hasil Prediksi = Terprediksi Kanker Payudara")
)

(defrule negative-cancer
?result <- (result 0)
=>
(retract ?result)
(printout t "Hasil Prediksi = Terprediksi Tidak Kanker Payudara")
)

