### R code from vignette source 'SmithLabArray.Rnw'

###################################################
### code chunk number 1: SmithLabArray.Rnw:40-41
###################################################
library('SmithLabArray')


###################################################
### code chunk number 2: SmithLabArray.Rnw:299-305
###################################################
library('ALL')
data('ALL')
selSamples <- ALL$mol.biol %in% c('ALL1/AF4', 'E2A/PBX1')
ALLs <- ALL[, selSamples]

sigs <- deriveSignature(ALLs, 'mol.biol', 'ALL1/AF4', lfc=0)


###################################################
### code chunk number 3: SmithLabArray.Rnw:354-355
###################################################
wanted <- as.character(unlist(lapply(sigs, subset, select='id', drop=TRUE)))


###################################################
### code chunk number 4: SmithLabArray.Rnw:362-366
###################################################
ALLs <- ALLs[ featureNames(ALLs) %in% wanted, ]
data(hmcol)
quantileColorHM(ALLs, col=rgcol, center=TRUE, trace='none',
                ColSideColors=ifelse(ALLs$mol.biol == 'ALL1/AF4', 'red', 'blue'))


###################################################
### code chunk number 5: SmithLabArray.Rnw:393-394
###################################################
hobj <- plotArrayHopach(ALLs, covariates=c('mol.biol'), kmax=2, col=hmcol)


###################################################
### code chunk number 6: SmithLabArray.Rnw:442-443
###################################################
sessionInfo()


