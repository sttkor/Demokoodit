#Tehtävä 1 b)
par(mar = c(4, 4, 4,4) + 0.1) 
S <- matrix(c(16,4,4,4), ncol = 2)
hajotelma <- eigen(S)

ominaisvektorit <- hajotelma$vectors

plot(0, 0, xlim = c(-2, 2), ylim = c(-2, 2),
     xlab = "x1", ylab = "x2", main = "Kovarianssimatriisin pääakselit")
abline(h = 0, v = 0, lty = 2) 

arrows(0, 0, ominaisvektorit[1,1], ominaisvektorit[2,1], length = 0.1, col = "blue")
arrows(0, 0, ominaisvektorit[1,2], ominaisvektorit[2,2], length = 0.1, col = "blue")

#c) tehdään sama korrelaatiomatriisille
R <- matrix(c(1.0,0.5,0.5,1), ncol = 2)
ominaishajotelma <- eigen(R)

ominaisvektoritR <- ominaishajotelma$vectors

plot(0, 0, xlim = c(-2, 2), ylim = c(-2, 2),
     xlab = "x1", ylab = "x2", main="Korrelaatiomatriisin pääakselit")
abline(h = 0, v = 0, lty = 2) 

arrows(0,0, ominaisvektoritR[1,1], ominaisvektoritR[2,1], lenght = 0.1, col = "red")
arrows(0,0, ominaisvektoritR[1,2], ominaisvektoritR[2,2], lenght = 0.1, col = "red")

# Tehtävä 4

library ( psychTools )
X <- msq [ ,1:72]
X <- X[complete.cases(X),]

library(corrplot)
corX <- cor(X)
corrplot (corX , method = "color", tl.col = "black", tl.cex=0.5)
corrplot (corX*(corX>0.7), method = "color", tl.col =  "black", tl.cex= 0.5)


# Printataan NA corX arvoille jotka ovat alle 0.6
corX[corX <= 0.6] <- NA
corX
#Ashamed ja sorry 0.62, käy järkeen, upset ja angry 0.63, attentive ja wide awake 0.69, lively active 0.75
corX <- cor(X)
corX[corX > -0.4] <- NA
corX
# Negatiiviset korrelaatiot sleepy sluggish tired angryn kanssa. Drowsy attentive ja angry.
ULU <-eigen(cor(X))
U <- ULU$vectors
W <- as.matrix(X) %*% U #Pääkomponentit
plot(W[,1:2], main = "Biplot msq-aineistolle", xlab = "PC1", ylab = "PC2", asp = 1)
arrows(0,0, 5*U[,1], 5*U[,2], length = 0.5, col = "blue")
text(6.5*U[,1], 5.5*U[,2], labels = colnames(X), cex=0.8, col = "blue")


# Tehtävä 4
library(psychTools)
X <- msq[, 1:72]
X <- X[complete.cases(X), ]

library(corrplot)
corX <- cor(X)
corrplot(corX, method = "color", tl.col = "black", tl.cex = 0.5)
corrplot(corX * (corX > 0.7), method = "color", tl.col = "black", tl.cex = 0.5)

# Printataan NA corX arvoille jotka ovat alle 0.6
corX[corX <= 0.6] <- NA
corX
#Ashamed ja sorry 0.62, käy järkeen, upset ja angry 0.63, attentive ja wide awake 0.69, lively active 0.75
corX <- cor(X)
corX[corX > -0.4] <- NA
corX

S <- cov(X)
ULU <- eigen(S)
U <- ULU$vectors

varianssit <- cumsum(ULU$values) / sum(ULU$values)
which(varianssit > 0.5)[1]

plot(U[, 1], U[, 2], type = "n", main = "Latauspiirros", xlab = "PC1", ylab = "PC2", asp = 1)
arrows(0, 0, U[, 1], U[, 2], length = 0.1, col = "blue")
text(U[, 1] * 1.15, U[, 2] * 1.15, labels = colnames(X), cex = 0.6)
# Ensimmäisen pääkomponentti lataa tunnetilan vireyden mukaan, toinen tunnetilan jännittyneisyyttä ja yleistä häiritsevyyttä

# Tehtävä 5
# a)
data <- read.csv("FreeDance2024.csv")
X_comp <- data[data$Component == "Composition", c("J1", "J2", "J3", "J4", "J5", "J6", "J7", "J8", "J9")]
X_pres <- data[data$Component == "Presentation", c("J1", "J2", "J3", "J4", "J5", "J6", "J7", "J8", "J9")]
X_skat <- data[data$Component == "Skating", c("J1", "J2", "J3", "J4", "J5", "J6", "J7", "J8", "J9")]
# Nyt 20x9 (nxp) matriisissa on sarakkeilla tuomarit, ja tietyn pisteryhmän annetut pisteet

cor_comp <- cor(X_comp)
cor_pres <- cor(X_pres)
cor_skat <- cor(X_skat)
corrplot(cor_comp)
corrplot(cor_pres)
corrplot(cor_skat)
#vaikuttaisi, että cor_pres on pienimmät korrelaatiot. Toinen tapa tarkastella samaa asiaa on ottaa se matriisi
# /corrplotti jossa on pienin arvo
min(cor_comp[lower.tri(cor_comp)])
min(cor_pres[lower.tri(cor_pres)])
min(cor_skat[lower.tri(cor_skat)])
# joka täsmää ensimmäistä havaintoa

#b)

library(factoextra)

X <- X_pres
pca <- prcomp(X, center = TRUE, scale. = TRUE)

summary(pca)

fviz_pca_biplot(pca, repel = T)

# Tuomarin 5 pisteytystapa vaikuttaisi olevan poikkeavin, varsinkin 2 dimsnsion suunnassa. Kuitenkin Dim1 selittää
# 86% varianssista, ja tässä suunnassa tuomarit ovat hyvin lähekkäin toisiaan. Huomattavaa tosin on, että J5 on tässä suunnassa vähiten latautunut kaikista tuomareista