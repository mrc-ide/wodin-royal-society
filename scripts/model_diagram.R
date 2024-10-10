
library(flodia)


respiratory_virus <- function(S_x = 1, S_y = 1,
                  label = list(S = "S", E = "E",
                               I_A = expression(I[A]),
                               I_M = expression(I[M]),
                               I_H =expression(I[H]),
                               H = "H",
                               R = "R",
                               D = "D"),
                  RS_pos = 0.5) {
  
  # define the radius of the nodes
  r <- 0.1
  xgap <- 0.3
  xgap_long <- 0.6
  ygap <- 0.3
  
  # specify colours for the nodes
  col <- list(S = light_palette("gnbu"),
              E = light_palette("rdor"),
              I = light_palette("ylgn"),
              R = light_palette("bupu"))
  
  
  # draw S at (S_x, S_y)
  S <- node(x = S_x, y = S_y, r = r, label = label$S, node_col = col$S)
  # draw E xgap units to the right of 
  E <- node(x = S$x1 + xgap * 0.8, y = S$y, r = r, label = label$E, node_col = col$E)
  # draw D 1.5 * xgap units to the right, and ygap units above E
  

  
  # draw A at the same x-coordinate as d, and ygap units below E
  I_M <- node(x =  E$x1 + xgap_long, y = E$y - ygap / 2, r = r, label = label$I_M, node_col = col$I)
  I_H <- node(x = I_M$x, y = I_M$y - ygap, r = r, label = label$I_H, node_col = col$I)
  
  I_A <- node(x = I_M$x, y = I_M$y + ygap, r = r, label = label$I_A,
              node_col = col$I)
  
  H <- node(x = I_H$x1 + xgap, y = I_H$y, r = r, label = label$H, node_col = col$R)
  
  # draw R xgap units to the right of A and D
  R <- node(x = H$x1 + xgap_long * 0.8, y = I_M$y, r = r, label = label$R, node_col = col$R)
  D <- node(x = R$x, y = H$y - ygap / 2, r = r, label = label$D, node_col = col$R)
  
  # add flows
  # connect S to E
  flowx(from = S, to = E, label = expression(lambda))
  
  symptom_node <- node(x = calc_pos(E$x, I_M$x, 0.55), y = calc_pos(I_M$y, I_H$y), r = 0)
  fork_h <- forkx(E, to0 = I_A, to1 = symptom_node, arr_width1 = 0, pos = 0.7,
                  label_from = expression(1/D[E]),
                  label_to0 = expression(1-p[S]), label_to1 = expression(p[S]))
  forkx(symptom_node, to0 = I_M, to1 = I_H, pos = 0.01,
        label_to0 = expression(1 - IHR[a]), label_to1 = expression(IHR[a]))
  
  bendx(from = I_A, to = R, label_from = expression(1/D[S]))
  flowx(from = I_M, to = R, label = expression(1/D[S]), pos = 2/3)
  flowx(from = I_H, to = H, label = expression(1/D[S]))
  forkx(from = H, to1 = R, to0 = D, pos = 0.45, pos_to1 = 1/3,
        label_from = expression(1/D[H]), label_to0 = expression(HFR[a]),
        label_to1 = expression(1 - HFR[a]), label_to1_gap = -0.05)
  
  
  # return a list of the left, right, bottom and top co-ordinates
  # additionally return node S co-ordinates
  list(x0 = S$x0, x1 = R$x1, y0 = D$y0, y1 = I_A$y1)
}


flodia_png(respiratory_virus, filepath = "respiratory_virus.png", res = 160)



respiratory_virus_simple <- function(S_x = 1, S_y = 1,
                              label = list(S = "S",
                                           E = "E",
                                           A = "A",
                                           I = "I",
                                           H = "H",
                                           R = "R",
                                           D = "D"),
                              RS_pos = 0.5) {
  
  # define the radius of the nodes
  r <- 0.1
  xgap <- 0.3
  xgap_long <- 0.4
  ygap <- 0.2
  
  # specify colours for the nodes
  col <- list(S = light_palette("gnbu"),
              E = light_palette("rdor"),
              I = light_palette("ylgn"),
              R = light_palette("bupu"))
  
  
  # draw S at (S_x, S_y)
  S <- node(x = S_x, y = S_y, r = r, label = label$S, node_col = col$S)
  # draw E xgap units to the right of 
  E <- node(x = S$x1 + xgap, y = S$y, r = r, label = label$E, node_col = col$E)
  # draw D 1.5 * xgap units to the right, and ygap units above E
  
  
  
  # draw A at the same x-coordinate as d, and ygap units below E
  A <- node(x = E$x1 + xgap_long, y = E$y + ygap, r = r, label = label$A,
              node_col = col$I)
  I <- node(x = A$x, y = E$y - ygap, r = r, label = label$I, node_col = col$I)
  

  
  H <- node(x = I$x1 + xgap_long, y = I$y - ygap, r = r, label = label$H, node_col = col$R)
  
  # draw R xgap units to the right of A and D
  R <- node(x = H$x1 + xgap_long * 0.8, y = E$y, r = r, label = label$R, node_col = col$R)
  D <- node(x = R$x, y = H$y - 0.0001, r = r, label = label$D, node_col = col$R)
  # 
  # # add flows
  # # connect S to E
  flowx(from = S, to = E)
  # 
  # symptom_node <- node(x = calc_pos(E$x, I_M$x, 0.55), y = calc_pos(I_M$y, I_H$y), r = 0)
  forkx(E, to0 = I, to1 = A)
  forkx(I, to0 = H, to1 = R, pos_to1 = 0.5)
  forkx(H, to1 = R, to0 = D, pos_to1 = 0.2)
  bendx(A, R)
    list(x0 = S$x0, x1 = R$x1, y0 = D$y0, y1 = A$y1)
}

flodia_png(respiratory_virus_simple, filepath = "help/viral_respiratory.png", res = 200)




