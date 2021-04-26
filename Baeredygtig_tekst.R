library(pdftools)
library(dplyr)
library(tidyverse)
library(tidytext)
library(tokenizers)
library(stopwords)

spar<-pdf_text("C:/Users/nikol/OneDrive/Skrivebord/Prospekter/prospekt-vpf.pdf") %>% 
  readr::read_lines()

spar <- tibble(text = spar)

tidy_spar <- spar %>%
  unnest_tokens(word,text, token = "words", strip_punct=TRUE)

tidy_spar_stop <- tidy_spar %>% 
  filter(!(word %in% stopwords(source="snowball", language = "da")))

