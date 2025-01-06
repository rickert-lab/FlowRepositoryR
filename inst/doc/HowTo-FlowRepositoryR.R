### R code from vignette source 'HowTo-FlowRepositoryR.Rnw'

###################################################
### code chunk number 1: LoadPackage
###################################################
library(FlowRepositoryR)


###################################################
### code chunk number 2: ListDatasets
###################################################
dataSets <- flowRep.ls()
## We will only show a maximum of 10 identifiers so that we don't
## clutter the vignette
dataSets[1:min(10, length(dataSets))]


###################################################
### code chunk number 3: SearchDatasets
###################################################
flowRep.search("OMIP-016")


###################################################
### code chunk number 4: GetDataset
###################################################
## FR-FCM-ZZJ7 is a purposely picked dataset that is public and very
## small for the unit tests and the vignette and man pages to compile 
## quickly. Also, FlowRepository is not tracking the downloads of this 
## particular dataset since the stats would be based mainly on these 
## automated downloads.
ds <- flowRep.get("FR-FCM-ZZJ7")
summary(ds)


###################################################
### code chunk number 5: DownloadData
###################################################
ds <- download(ds)
summary(ds)


###################################################
### code chunk number 6: WhereIsMyFile
###################################################
localpath(fcs.files(ds)[[1]])


###################################################
### code chunk number 7: WhereAreMyFCSFiles
###################################################
unlist(lapply(fcs.files(ds), function(x) paste(localpath(x))))


###################################################
### code chunk number 8: WhereAreMyAttachments
###################################################
unlist(lapply(attachments(ds), function(x) paste(localpath(x))))


###################################################
### code chunk number 9: setFlowRepositoryCredentials
###################################################
setFlowRepositoryCredentials(email="boo@gmail.com", password="foo123456")


###################################################
### code chunk number 10: forgetFlowRepositoryCredentials
###################################################
forgetFlowRepositoryCredentials()


###################################################
### code chunk number 11: DownloadDataPartially
###################################################
myDataset <- flowRep.get("FR-FCM-ZZJ7")
summary(myDataset)

## And download a single attachment file
at1 <- download(attachments(myDataset)[[1]])
localpath(at1)
summary(at1)

## A single FCS file proxy can be downloaded
fcs1 <- download(fcs.files(myDataset)[[1]])
localpath(fcs1)
summary(fcs1)


