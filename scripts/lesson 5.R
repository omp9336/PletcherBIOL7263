require(tidyverse)

mpg

mpg_fact <- mpg %>%
  mutate(class = factor(class, levels = c("2seater", "subcompact", "compact", "midsize", "minivan", "pickup", "suv")))

glimpse(mpg_fact)         

p1 <- ggplot(mpg_fact, aes(x = class, y = hwy))+
  stat_summary(fun = mean,
               geom = "col",
               width = 0.5,
               color = "red", fill = "white")+
  stat_summary(geom = "errorbar", 
               width = 0.3) +
  ylim(0,45)+
  coord_flip()

p1

p2 <- ggplot(mpg_fact, aes(class, hwy))+
  geom_boxplot(color = "red")+
  ylim(0,45)+
  coord_flip()

p2

p3 <- ggplot(mpg_fact, aes(class, hwy))+
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75) ,color = "black")+
  ylim(0,45)+
  stat_summary(fun = mean,
               color = "red")+
  coord_flip()

p3

p4 <- ggplot(mpg_fact, aes(class, hwy))+
  geom_jitter(width = 0.3,
              alpha = 0.4, size = 1.5)+
  stat_summary(geom = "errorbar",
               color = "blue")+
  stat_summary(fun = mean,
               geom = "crossbar",
               color = "red")+
  ylim(0,45)+
  coord_flip()

p4  

require(patchwork)  

(p1 + p2)/(p3 + p4)

ID<-c("A","B","C","D","E","F","G","A","B","C","D","E","F","G")
Obs<-c("before","before","before","before","before","before","before","after","after","after","after","after","after","after")
Measure<-c(runif(1:7),runif(1:7)*4)

RepEx<-tibble(ID,Obs,Measure)

RepEx<-RepEx %>% 
  mutate(Obs = factor(Obs, levels = c("before","after")))

p6<-ggplot(RepEx, aes(Obs, Measure))+
  geom_point(alpha = 0.4, 
             size = 4, 
             aes(color = ID))+
  geom_line(size = 2, 
            alpha = 0.4, 
            aes(color = ID,  group = ID))

p6

p7<-ggplot(RepEx, aes(Obs, Measure))+
  stat_summary(fun = mean, 
               geom = "col", 
               width = 0.5, 
               fill = "white") +
  stat_summary(geom = "errorbar", 
               width = 0.3) 
p7
