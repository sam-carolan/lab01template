visitors <- read_csv("data/UK-visitor-numbers.csv")
visitors %>% head(n = 10)
nrow(visitors)
visitors %>% summarise_all(class)
visitors %>% arrange(desc(n_2022))
visitors %>% filter(attraction == "National Museum of Scotland")
visitors %>% filter(n_2022 == 565772)
visitors %>% filter(n_2022 > 1000000)
onemilly <- visitors %>% filter(n_2022 > 1000000)
nrow(onemilly)

visitors %>% 
  filter(
    n_2022 >= 100000, 
    region == "Yorkshire and the Humber", 
    admission == "Members", 
    setting == "o"
    ) %>%
  count()

visitors %>% 
  filter(
    n_2022 <= 100000,
    n_2022 >= 50000,
    ) %>%
  count()

regiontable <- visitors %>% count(region)
visitors %>% filter(region >= 50)

visitors %>%
  count(region) %>%
  filter(n >= 50)

regiontable %>% filter(n >= 50)

visitors %>% 
  summarise(
    mean_2021 = mean(n_2021, na.rm = TRUE), 
    median_2021 = median(2021),
  )

visitors_with_nations <- visitors

visitors_with_nations %>%
  mutate(
    nation = case_when(
      region == "Nothern Ireland" ~ "Northern Ireland",
      region == "Scotland" ~ "Scotland",
      region == "Wales" ~ "Wales",
      TRUE ~ "England"
    )
  ) %>%
  group_by(nation) %>%
  summarise(
    IQR_2022 = IQR(n_2022, na.rm = TRUE)
  )

visitors_with_nations %>%
  group_by(nation) %>%
  summarise(
    IQR_2022 = IQR(n_2022)
  )

regiontable
