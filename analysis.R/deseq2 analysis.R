# Install package for DE expression analysis #
renv::install(c("XML", "bioc::DESeq2", "pheatmap"))
library(DESeq2)
library(pheatmap)

# Read in the data for DEG analysis # 
read_in <- '~/MyDocuments/projects - KI/learning/R course/'
counts <- read.delim(paste0(read_in, "count_table.txt")); head(counts)
exp.info <- data.frame(patient=rep(c("02","03","06"),2), condition=c(rep("C",3),rep("N",3)))
rownames(exp.info) <- colnames(counts)


# Build DESeq2 object
dds <- DESeqDataSetFromMatrix(countData=counts, colData=exp.info,design=~patient+condition)


# Transformation and ploting
r <- rlogTransformation(dds)
pheatmap(cor(assay(r)),annotation=exp.info)
print(plotPCA(r,intgroup="condition"))

# DEG analysis; extract results and subset for significant ones
dds <-DESeq(dds)
res <- results(dds)
res.sig <- res[which(res$padj<0.01),]
res.sig <- res.sig[order(res.sig$padj),]
res.sig
