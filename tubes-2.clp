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
)

( defrule rule10-b
    (mean-concave-points ?mean-concave-points)
    (test (> ?mean-concave-points 0.05))
    =>
    (printout t crlf "Worse-perimeter: ")
    (assert (worse-perimeter (read)))
)

(defrule rule11-a
    (mean-concave-points ?mean-concave-points)
    (worse-perimeter ?worse-perimeter)
    (test (> ?mean-concave-points 0.05))
    (test (<= ?worse-perimeter 114.45))
=>
    (printout t crlf "Worse-texture: ")
    (assert (worse-texture (read)))
)

(defrule rule11-b
    (mean-concave-points ?mean-concave-points)
    (worse-perimeter ?worse-perimeter)
    (test (> ?mean-concave-points 0.05))
    (test (> ?worse-perimeter 114.45))
=>
    (assert (result 0))
)

(defrule rule12-a
    (worse-perimeter ?worse-perimeter)
    (worse-texture ?worse-texture)
    (test (<= ?worse-perimeter 114.45))
    (test (<= ?worse-texture 25.65))
=>
    (printout t crlf "Worse-concave-points: ")
    (assert (worse-concave-points (read)))
)

(defrule rule12-b
    (worse-perimeter ?worse-perimeter)
    (worse-texture ?worse-texture)
    (test (<= ?worse-perimeter 114.45))
    (test (> ?worse-texture 25.65))
=>
    (printout t crlf "perimeter-error: ")
    (assert (perimeter-error (read)))
)

(defrule rule13-a
    (worse-texture ?worse-texture)
    (worse-concave-points ?worse-concave-points)
    (test (<= ?worse-texture 25.65))
    (test (<= ?worse-concave-points 0.17))
=>
    (assert (result 1))
)

(defrule rule13-b
    (worse-texture ?worse-texture)
    (worse-concave-points ?worse-concave-points)
    (test (<= ?worse-texture 25.65))
    (test (> ?worse-concave-points 0.17))
=>
    (assert (result 0))
)


(defrule rule14-a
    (worse-texture ?worse-texture)
    (perimeter-error ?perimeter-error)
    (test (> ?worse-texture 25.65))
    (test (<= ?perimeter-error 1.56))
=>
    (printout t crlf "Mean-radius: ")
    (assert (mean-radius (read)))
)

(defrule rule14-b
    (worse-texture ?worse-texture)
    (perimeter-error ?perimeter-error)
    (test (> ?worse-texture 25.65))
    (test (> ?perimeter-error 1.56))
=>
    (assert (result 0))
)

(defrule rule15-a
    (perimeter-error ?perimeter-error)
    (mean-radius ?mean-radius)
    (test (<= ?perimeter-error 1.56))
    (test (<= ?mean-radius 13.34))
=>
    (assert (result 0))
)

(defrule rule15-b
    (perimeter-error ?perimeter-error)
    (mean-radius ?mean-radius)
    (test (<= ?perimeter-error 1.56))
    (test (> ?mean-radius 13.34))
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

