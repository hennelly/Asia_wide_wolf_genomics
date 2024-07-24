#Read on cov file from PCAngsd output
cov<-as.matrix(read.table("output_Dec29_Asianwolf.txt.cov.txt"))

#Get eigenvalues and eigenvectors
e<-eigen(cov)
plot(e$vectors[,1:2])

e$values/sum(e$values)

#read in the sample list data
names<-read.csv("PCA_names3.csv", header=TRUE)

#remake the plot with the colors we want
pdf('Jan12_PCA.pdf', width=6, height=5)
plot(e$vectors[,1:2], pch=21, col="black", cex=2, bg=names$color)
dev.off()


#addtext
text(e$vectors[,1:2],
     labels = row.names(cov),
     cex = 0.6, pos = 4, col = "red")
text(e$vectors[,1:2],
     labels = row.names(names$Population),
     cex = 0.6, pos = 4, col = "red")
