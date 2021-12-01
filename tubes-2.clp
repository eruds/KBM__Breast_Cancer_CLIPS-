; ===================================================
; File: tubes-2.CLP
; Description: Breast cancer detector
; ===================================================

(defrule enter-message
=>
    (printout t crlf "Mean concave points: ")
    (assert (mean-concave-points  (read)))
)

( defrule rule1-a
    (mean-texture ?mean-texture)
    (mean-radius ?mean-radius)
    (test (<= ?mean-texture 28.79))
    (test (<= ?mean-radius 13.45))
    =>
    (assert (result 0))
)

( defrule rule1-b
    (mean-texture ?mean-texture)
    (mean-radius ?mean-radius)
    (test (> ?mean-texture 28.79))
    (test (<= ?mean-radius 13.45))
    =>
    (assert (result 1))
)

( defrule rule2-a
    (mean-radius ?mean-radius)
    (worst-area ?worst-area)
    (test (<= ?mean-radius 13.45))
    (test (> ?worst-area 641.6))
    =>
    (printout t crlf "Mean texture: ")
    (assert (mean-texture (read)))
)

( defrule rule2-b
    (mean-radius ?mean-radius)
    (worst-area ?worst-area)
    (test (> ?mean-radius 13.45))
    (test (> ?worst-area 641.6))
    =>
    (assert (result 1))
)

( defrule rule3-a
    (worst-area ?worst-area)
    (test (<= ?worst-area 641.6))
    =>
    (assert (result 1))
)

( defrule rule3-b
    (worst-area ?worst-area)
    (test (> ?worst-area 641.6))
    =>
    (printout t crlf "Mean radius: ")
    (assert (mean-radius (read)))
)

( defrule rule4-a
    (worst-texture ?worst-texture)
    (radius-error ?radius-error)
    (test (<= ?worst-texture 30.15))
    (test (<= ?radius-error 0.63))
    =>
    (assert (result 1))
)

( defrule rule4-b
    (worst-texture ?worst-texture)
    (radius-error ?radius-error)
    (test (> ?worst-texture 30.15))
    (test (<= ?radius-error 0.63))
    =>
    (printout t crlf "Worst area: ")
    (assert (worst-area (read)))
)

( defrule rule5-a
    (mean-smoothness ?mean-smoothness)
    (test (<= ?mean-smoothness 0.09))
    =>
    (assert (result 1))
)

( defrule rule5-b
    (mean-smoothness ?mean-smoothness)
    (test (> ?mean-smoothness 0.09))
    =>
    (assert (result 0))
)

( defrule rule6-a
    (radius-error ?radius-error)
    (test (<= ?radius-error 0.63))
    =>
    (printout t crlf "Worst texture: ")
    (assert (worst-texture (read)))
)

( defrule rule6-b
    (radius-error ?radius-error)
    (test (> ?radius-error 0.63))
    =>
    (printout t crlf "Mean smoothness: ")
    (assert (mean-smoothness (read)))
)

(defrule rule6
    (worst-radius ?worst-radius)
    (test (<= ?worst-radius 16.83))
    =>
    (printout t crlf "Radius-error: ")
    (assert (radius-error (read)))
)

(defrule rule7
    (mean-texture ?mean-texture)
    (worst-radius ?worst-radius)
    (test (> ?mean-texture 16.19))
    (test (> ?worst-radius 16.83))
    =>
    (printout t crlf "Concave points error: ")
    (assert (concave-points-error (read)))
)

(defrule rule7-a
    (concave-points-error ?concave-points-error)
    (test (<= ?concave-points-error 0.01))
    =>    
    (assert (result 0))
)

(defrule rule7-b
    (concave-points-error ?concave-points-error)
    (test (> ?concave-points-error 0.01))
    =>    
    (assert (result 1))
)

(defrule rule8
    (worst-radius ?worst-radius)
    (test (> ?worst-radius 16.83))
    =>
    (printout t crlf "Mean texture: ")
    (assert (mean-texture (read)))
)

(defrule rule8-a
    (mean-texture ?mean-texture)
    (worst-radius ?worst-radius)
    (test (<= ?mean-texture 16.19))
    (test (> ?worst-radius 16.83))
    =>    
    (assert (result 1))
)

(defrule rule9
    (mean-concave-points ?mean-concave-points)
    (test (<= ?mean-concave-points 0.05))
    =>
    (printout t crlf "Worst-radius: ")
    (assert (worst-radius (read)))
)

( defrule rule10-b
    (mean-concave-points ?mean-concave-points)
    (test (> ?mean-concave-points 0.05))
    =>
    (printout t crlf "Worst-perimeter: ")
    (assert (worst-perimeter (read)))
)

(defrule rule11-a
    (mean-concave-points ?mean-concave-points)
    (worst-perimeter ?worst-perimeter)
    (test (> ?mean-concave-points 0.05))
    (test (<= ?worst-perimeter 114.45))
=>
    (printout t crlf "Worst-texture: ")
    (assert (worst-texture (read)))
)

(defrule rule11-b
    (mean-concave-points ?mean-concave-points)
    (worst-perimeter ?worst-perimeter)
    (test (> ?mean-concave-points 0.05))
    (test (> ?worst-perimeter 114.45))
=>
    (assert (result 0))
)

(defrule rule12-a
    (worst-perimeter ?worst-perimeter)
    (worst-texture ?worst-texture)
    (test (<= ?worst-perimeter 114.45))
    (test (<= ?worst-texture 25.65))
=>
    (printout t crlf "Worst-concave-points: ")
    (assert (worst-concave-points (read)))
)

(defrule rule12-b
    (worst-perimeter ?worst-perimeter)
    (worst-texture ?worst-texture)
    (test (<= ?worst-perimeter 114.45))
    (test (> ?worst-texture 25.65))
=>
    (printout t crlf "perimeter-error: ")
    (assert (perimeter-error (read)))
)

(defrule rule13-a
    (worst-texture ?worst-texture)
    (worst-concave-points ?worst-concave-points)
    (test (<= ?worst-texture 25.65))
    (test (<= ?worst-concave-points 0.17))
=>
    (assert (result 1))
)

(defrule rule13-b
    (worst-texture ?worst-texture)
    (worst-concave-points ?worst-concave-points)
    (test (<= ?worst-texture 25.65))
    (test (> ?worst-concave-points 0.17))
=>
    (assert (result 0))
)


(defrule rule14-a
    (worst-texture ?worst-texture)
    (perimeter-error ?perimeter-error)
    (test (> ?worst-texture 25.65))
    (test (<= ?perimeter-error 1.56))
=>
    (printout t crlf "Mean-radius: ")
    (assert (mean-radius (read)))
)

(defrule rule14-b
    (worst-texture ?worst-texture)
    (perimeter-error ?perimeter-error)
    (test (> ?worst-texture 25.65))
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
(printout t crlf "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
(reset)
(halt)
)

(defrule negative-cancer
?result <- (result 0)
=>
(retract ?result)
(printout t crlf "Hasil Prediksi = Terprediksi Tidak Kanker Payudara" crlf)
(reset)
(halt)
)

