library(here)
library(tidyverse)
library(palmerpenguins)


## Summary of Lengths

sum_penguins <- penguins |>
  group_by(species) |>
  summarize(across(
    c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"),
    ~mean(.x, na.rm = TRUE)),
    .groups = "drop")

save(sum_penguins, file = here("output/quarto_academic_tips/sum_penguins.rds"))

## Comparison Bill Length by sex

bill_length_sex <- penguins |>
  filter(!is.na(sex)) |>
  group_by(species, sex) |>
  summarize(bill_length = mean(bill_length_mm, na.rm = TRUE),
            .groups = "drop") |>
  pivot_wider(names_from = "sex", values_from = "bill_length", names_prefix = "bill_length_")

save(bill_length_sex, file = here("output/quarto_academic_tips/bill_length_sex.rds"))

## Beta Distribution Simulation
n <- 101
xs <- seq(0, 1, length.out = n)

dens_beta <- tibble(
    x = c(xs, xs),
    pars = c(rep("par_2_2", n), rep("par_2_5", n)),
    dens = c(dbeta(xs, 2, 2), dbeta(xs, 2, 5))
    )

save(dens_beta, file = here("output/quarto_academic_tips/dens_beta.rds"))

sum <- dens_beta |>
  group_by(pars) |>
  summarize(mean = mean(dens), median = median(dens), var = var(dens))

sum_beta <- as_tibble(cbind(name = names(sum[2:ncol(sum)]), t(sum[,2:ncol(sum)]))) |>
  rename("par_2_2" = "V2", "par_2_5" = "V3") |>
  mutate(across(starts_with("par"), as.numeric))

save(sum_beta, file = here("output/quarto_academic_tips/sum_beta.rds"))
