# Define the total UK population size
N <- user(69e6, min = 0)  # Approximate total UK population (69 million)

# Proportion of population in each age group (approximate)
school_age_proportion <- 0.23  # School-age (0-19 years)
working_age_proportion <- 0.57  # Working-age (20-64 years)
retired_age_proportion <- 0.20  # Retired (65+ years)

# Split the population into three age groups based on the proportions
N01 <- N * school_age_proportion  # School-age population
N02 <- N * working_age_proportion  # Working-age population
N03 <- N * retired_age_proportion  # Retired-age population

# Proportion of infectious individuals in each age group with isolation NPI applied to I and T
C01 <- A01 + I01 * npi_isolation_symptoms + T01 * npi_isolation_testing + M01
C02 <- A02 + I02 * npi_isolation_symptoms + T02 * npi_isolation_testing + M02
C03 <- A03 + I03 * npi_isolation_symptoms + T03 * npi_isolation_testing + M03

# Homogeneous mixing assumption for total force of infection
C_total <- (C01 + C02 + C03) / N

# User-defined NPI parameters
t_npi <- user(30, min = 0)  # time when NPIs come into effect
npi_transmission_school_effect <- user(0, min = 0, max = 1)
npi_transmission_working_effect <- user(0, min = 0, max = 1)
npi_transmission_retired_effect <- user(0, min = 0, max = 1)
npi_transmission_total_effect <- user(0, min = 0, max = 1)
npi_isolation_symptoms_effect <- user(0, min = 0, max = 1)  # Reduction in infectiousness after symptoms
npi_isolation_testing_effect <- user(0, min = 0, max = 1)  # Reduction in infectiousness after testing
npi_importations_effect <- user(0, min = 0, max = 1)  # Reduction in importations after NPIs

importations_user <- user(10, min = 0)  # Constant number of importations per day among adults

# Apply NPIs based on the time
npi_transmission01 <- if (t < t_npi) 1 else 1 - max(npi_transmission_total_effect, npi_transmission_school_effect)
npi_transmission02 <- if (t < t_npi) 1 else 1 - max(npi_transmission_total_effect, npi_transmission_working_effect)
npi_transmission03 <- if (t < t_npi) 1 else 1 - max(npi_transmission_total_effect, npi_transmission_retired_effect)
npi_isolation_symptoms <- if (t < t_npi) 1 else 1 - npi_isolation_symptoms_effect  # Reduction in infectiousness after symptoms
npi_isolation_testing <- if (t < t_npi) 1 else 1 - npi_isolation_testing_effect  # Reduction in infectiousness after testing
npi_importations <- if (t < t_npi) 1 else 1- npi_importations_effect  # Reduction in importations after NPIs

# Importations occur only in working age adults
importations <- importations_user * npi_importations  # Modified by NPI


# Homogeneous mixing for each age group with proportional contact
foi01 <- npi_transmission01 * beta * C_total
foi02 <- npi_transmission02 * beta * C_total
foi03 <- npi_transmission03 * beta * C_total

# New infections considering both imported and locally acquired, ensuring not to exceed susceptibles
new_infections01 <- min(S01, foi01 * S01)
new_infections02 <- min(S02, foi02 * S02 + importations)
new_infections03 <- min(S03, foi03 * S03)

# Compartment-specific rates calculated from durations
dur_E <- user(2, min = 0)  # duration in E compartment
dur_A <- user(3, min = 0)  # duration in A compartment
dur_I <- user(3, min = 0)  # duration in I compartment
dur_T <- user(2, min = 0)  # duration in T compartment
dur_M <- user(5, min = 0)  # duration in M compartment
dur_H <- user(7, min = 0)  # duration in H compartment
testing_rate <- 0  # not used currently

rate_E <- 1 / dur_E  # rate from E to A/I
rate_A <- 1 / dur_A  # rate from A to T/R
rate_I <- 1 / dur_I  # rate from I to M/H
rate_T <- 1 / dur_T  # rate from T to R
rate_M <- 1 / dur_M  # rate from M to R
rate_H <- 1 / dur_H  # rate from H to R/D

# Calculate beta from R0
R0 <- user(2.5, min = 0)  # Basic reproduction number (R0)
dur_C01 <- p_S * (dur_I + (1 - IHR01) * dur_M) + (1 - p_S) * dur_A 
dur_C02 <- p_S * (dur_I + (1 - IHR02) * dur_M) + (1 - p_S) * dur_A 
dur_C03 <- p_S * (dur_I + (1 - IHR03) * dur_M) + (1 - p_S) * dur_A 

dur_C <- (C01 * dur_C01 + C02 * dur_C02 + C03 * dur_C03) / C
beta <- R0 / dur_C  # Transmission rate (beta) based on R0 and infectious period

# variables for age group 01 (school-age)
deriv(S01) <- -new_infections01
deriv(E01) <- new_infections01 - rate_E * E01
deriv(A01) <- (1 - p_S) * rate_E * E01 - rate_A * A01 - testing_rate * A01
deriv(I01) <- p_S * rate_E * E01 - rate_I * I01
deriv(T01) <- testing_rate * A01 - rate_T * T01
deriv(M01) <- (1 - IHR01) * rate_I * I01 - rate_M * M01
deriv(H01) <- IHR01 * rate_I * I01 - rate_H * H01
deriv(R01) <- rate_A * A01 + rate_T * T01 + (1 - HFR01) * rate_H * H01 + rate_M * M01
deriv(D01) <- HFR01 * rate_H * H01

# variables for age group 02 (working-age)
deriv(S02) <- -new_infections02
deriv(E02) <- new_infections02 - rate_E * E02
deriv(A02) <- (1 - p_S) * rate_E * E02 - rate_A * A02 - testing_rate * A02
deriv(I02) <- p_S * rate_E * E02 - rate_I * I02
deriv(T02) <- testing_rate * A02 - rate_T * T02
deriv(M02) <- (1 - IHR02) * rate_I * I02 - rate_M * M02
deriv(H02) <- IHR02 * rate_I * I02 - rate_H * H02
deriv(R02) <- rate_A * A02 + rate_T * T02 + (1 - HFR02) * rate_H * H02 + rate_M * M02
deriv(D02) <- HFR02 * rate_H * H02

# variables for age group 03 (retired-age)
deriv(S03) <- -new_infections03
deriv(E03) <- new_infections03 - rate_E * E03
deriv(A03) <- (1 - p_S) * rate_E * E03 - rate_A * A03 - testing_rate * A03
deriv(I03) <- p_S * rate_E * E03 - rate_I * I03
deriv(T03) <- testing_rate * A03 - rate_T * T03
deriv(M03) <- (1 - IHR03) * rate_I * I03 - rate_M * M03
deriv(H03) <- IHR03 * rate_I * I03 - rate_H * H03
deriv(R03) <- rate_A * A03 + rate_T * T03 + (1 - HFR03) * rate_H * H03 + rate_M * M03
deriv(D03) <- HFR03 * rate_H * H03

# Initial conditions for age group 01 (school-age, no seeding with infections)
initial(S01) <- N01
initial(E01) <- 0
initial(A01) <- 0
initial(I01) <- 0
initial(T01) <- 0
initial(M01) <- 0
initial(H01) <- 0
initial(R01) <- 0
initial(D01) <- 0

# Initial conditions for age group 02 (working-age, no seeding with infections)
initial(S02) <- N02
initial(E02) <- 0
initial(A02) <- 0
initial(I02) <- 0
initial(T02) <- 0
initial(M02) <- 0
initial(H02) <- 0
initial(R02) <- 0
initial(D02) <- 0

# Initial conditions for age group 03 (retired-age, no seeding with infections)
initial(S03) <- N03
initial(E03) <- 0
initial(A03) <- 0
initial(I03) <- 0
initial(T03) <- 0
initial(M03) <- 0
initial(H03) <- 0
initial(R03) <- 0
initial(D03) <- 0

# Quantities to output
output(infections01) <- new_infections01
output(infections02) <- new_infections02
output(infections03) <- new_infections03

# Summary outputs
output(S_total) <- S01 + S02 + S03
output(E_total) <- E01 + E02 + E03
output(A_total) <- A01 + A02 + A03
output(I_total) <- I01 + I02 + I03
output(T_total) <- T01 + T02 + T03
output(M_total) <- M01 + M02 + M03
output(H_total) <- H01 + H02 + H03
output(R_total) <- R01 + R02 + R03
output(D_total) <- D01 + D02 + D03

# Parameters
p_S <- user(0.7, min = 0, max = 1)  # Probability of developing symptoms
IHR01 <- user(0.1, min = 0, max = 1)  # Infection Hospitalisation Rate for age group 01
IHR02 <- user(0.1, min = 0, max = 1)  # Infection Hospitalisation Rate for age group 02
IHR03 <- user(0.1, min = 0, max = 1)  # Infection Hospitalisation Rate for age group 03
IFR01 <- user(0.1, min = 0, max = 1)  # Infection Fatality Rate for age group 01
IFR02 <- user(0.1, min = 0, max = 1)  # Infection Fatality Rate for age group 02
IFR03 <- user(0.1, min = 0, max = 1)  # Infection Fatality Rate for age group 03

# Derived Hospital Fatality Rate (HFR) from IFR and IHR
HFR01 <- IFR01 / IHR01
HFR02 <- IFR02 / IHR02
HFR03 <- IFR03 / IHR03

# Check total population size by summing all compartments across all age groups
output(check_total_popsize) <- (S01 + E01 + A01 + I01 + T01 + M01 + H01 + R01 + D01) +
  (S02 + E02 + A02 + I02 + T02 + M02 + H02 + R02 + D02) +
  (S03 + E03 + A03 + I03 + T03 + M03 + H03 + R03 + D03)