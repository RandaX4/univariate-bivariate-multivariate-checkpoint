View(CleanCreditScoring)
df <-CleanCreditScoring
df
mean(df$Income)
median(df$Income)
var(df$Income)
sd(df$Income)
mean(df$Age)
median(df$Age)
var(df$Age)
sd(df$Age)
summary(df$Age)
cor(df$Age,df$Income)
linearMod<-lm(Age~Income,data=df)
print(linearMod)
select(Seniority,Time,Age,Expenses,Income,Assets,Debt,Amount,Price,Finrat,SavingS)
dfn<-select(df,Seniority,Time,Age,Expenses,Income,Assets,Debt,Amount,Price,Finrat,Savings)
df_standardize<-as.data.frame(scale(dfn))
df_standardize
df.mat<-as.matrix(df_standardize)
cov.mat<-cor(df_standardize)
pca<-prcomp(df_standardize,center=T,scale=T)
summary(pca)
library(ggfortify)
autoplot(pca,data=df,colour='Status')
library(FactoMineR)
dfc<-select(df,Status,Home,Marital,Records,Job)
res.mca<-MCA(dfc, graph=FALSE)
fviz_mca_biplot(res.mca, 
                repel = TRUE, # Avoid text overlapping (slow if many point)
                ggtheme = theme_minimal())
