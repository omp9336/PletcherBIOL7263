install.packages("MuMIn") 

install.packages("AICcmodavg") 

library(MuMIn)

library(AICcmodavg)

banding <-SD_banding_data

glm_example <- glm(mass~tarsus+wing, data=banding, family=gaussian)

glm_example

summary(glm_example)

anova(glm_example, test="F")

?aictab

AIC(glm_example)

AICc(glm_example)

banding_na <- na.omit(banding)

mass_model<- glm(mass~tarsus*wing+fat+species, data = banding_na, family = gaussian, na.action = na.fail)

AICc_band_models <- dredge(
  mass_model,
  rank = "AICc",
  fixed = "species"
  )

View(AICc_band_models)

model_list <- get.models(AICc_band_models, subset = 1:5)

library(AICcmodavg)

madavg_table <- aictab(model_list, second.ord = TRUE, sort = TRUE)

View(madavg_table)

model_name_list<-NULL

for (i in 1:5){
  model_name_list = c(model_name_list, as.character(model_list[[i]][['formula']]))
} 

model_name_listb <- model_name_list[seq(3, length(model_name_list),3)]

modavg_table <- aictab(model_list,
                 modname = model_name_listb,
                 second.ord = TRUE,
                 sort = TRUE)

View(modavg_table)
