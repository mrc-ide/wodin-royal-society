# Modelling Non-Pharmaceutical Interventions for Viral Respiratory Pathogens

## Introduction

Non-pharmaceutical interventions (NPIs) are actions, apart from getting 
vaccinated and taking medicine, that people and communities can take to 
help slow the spread of illnesses like pandemic influenza or COVID-19. 
These actions include things like social distancing, mask-wearing, and 
quarantining.

## Modelling Non-Pharmaceutical Interventions

This tool enables the user to explore the potential impact of a range of 
non-pharmaceutical interventions (NPIs) on a potential outbreak of a viral
respiratory pathogen.

### A. Disease Transmission

The tool simulates how a respiratory virus spreads within an age-structured
population. People start in the “susceptible” category (S), meaning they are 
healthy but at risk of catching the disease. If they are exposed to someone 
infectious, they move into the “exposed” group (E), where they carry the 
virus but are not yet symptomatic. From here, they either 
develop symptoms and move into the “symptomatic infected” group (I), or 
they stay without symptoms and move into the “asymptomatic” group (A). 
Asymptomatic individuals all eventually recover (R), but symptomatic 
people might be hospitalized (H), and hospitalized people can either 
recover (R) or die (D). The age of an individual impacts their risk of different 
disease outcomes as well as the impact of different NPIs. The model tracks and
outputs how many people are in each disease stage over time.

**INSERT COMPARTMENTAL FIGURE HERE**

#### A.1. Disease Transmission Parameters

Infectious disease models are designed to mirror the specific biological 
and epidemiological characteristics of a pathogen. This process, known as 
parameterisation, involves setting key parameters that capture how a 
disease spreads, how quickly it progresses, and how it affects different 
segments of the population. For respiratory viruses, like COVID-19, a number
of different parameters need to be parameterised to accurately reflect how 
the virus behaves and to predict its impact.

------------------------------------------------------------------------

|                   Parameter                    |                                                                                                                     Definition                                                                                                                      |
|:----------------------------------:|:----------------------------------:|
|       **R0 (Basic Reproduction Number)**       |                  Measures how contagious a pathogen is by indicating the average number of secondary infections caused by one infected individual in a fully susceptible population. A higher R0 implies greater transmissibility.                  |
|             **Incubation Period**              |                     The time between exposure to the pathogen and the onset of symptoms. This period determines how quickly a pathogen spreads and can influence how long an individual is infectious before symptoms develop.                      |
|             **Symptomatic Period**             |               The duration during which an infected individual exhibits symptoms of the disease. The length of this period can affect the likelihood of identifying and isolating cases, influencing the success of control measures.               |
| **Percentage of Incubation Period Infectious** | The proportion of the incubation period during which an infected person is capable of transmitting the pathogen. This is critical for understanding the potential for pre-symptomatic transmission and designing effective intervention strategies. |
|   **Proportion of Asymptomatic Infections**    |                              The percentage of infected individuals who do not show symptoms but can still transmit the pathogen. This affects the overall transmission dynamics and may complicate control measures.                               |
|         **Severity by Age (IHR/IFR)**          |         Infection Hospitalisation Rate (IHR) and Infection Fatality Rate (IFR) describe the likelihood of an individual requiring hospital care or dying from the infection, often varying by age group and other individual risk factors.          |

------------------------------------------------------------------------

Different pathogens have distinct characteristics in terms of transmission dynamics, 
incubation periods, and severity, highlighted by comparing three notable viral 
respiratory pathogens: Severe Acute Respiratory Syndrome coronavirus 1 (SARS-1), 
influenza, and Respiratory Syncytial Virus (RSV). The table below summarises key 
epidemiological parameters for each respiratory viral pathogen.

------------------------------------------------------------------------

| Pathogen      | R0        | Incubation Period | Symptomatic Period                                                | Percentage of Incubation Period Infectious                 | Proportion of Asymptomatic Infections                                  | IFR                           | IHR                           |
|---------|---------|---------|---------|---------|---------|---------|---------|
| **SARS-1**    | \~2-3     | \~4-6 days        | \~7-10 days【INQ000249526†source】                                | \~10-20%【INQ000249526†source】                            | \<10%【INQ000249526†source】                                           | \~10%【INQ000249526†source】  | \~20%【INQ000249526†source】  |
| **Influenza** | 0.9 - 2.1 | \~1-2 days        | \~5-7 days【INQ000249526†source】                                 | \~30-50%【INQ000249526†source】                            | \~20-50%, varies by strain【INQ000249526†source】                      | \~0.1%【INQ000249526†source】 | \~2-5%【INQ000249526†source】 |
| **RSV**       | \~3       | \~3-6 days        | \~8-12 days in children; shorter in adults【INQ000249526†source】 | \~20-30% (primarily among children)【INQ000249526†source】 | \~40%, with higher asymptomatic rates in adults【INQ000249526†source】 | \<0.1%【INQ000249526†source】 | \~1-3%【INQ000249526†source】 |

------------------------------------------------------------------------

These parameters illustrate the differences in transmission dynamics and severity 
across pathogens, and help understand how to design appropriate public health 
strategies. For example, SARS-1 could be effectively controlled through isolating 
symptomatic individuals due to the limited pre-symptomatic transmission. On the 
other hand, influenza’s shorter incubation period and higher pre-symptomatic 
transmission requires broader interventions to reduce spread. RSV's higher R0, 
in combination with increased rates of pre-symptomatic transmission amongst 
children necessitates targeted paediatric responses. The combination of each 
parameter will determine how difficult the spread of the pathogen is to control.

### A.2. How To Choose Disease Transmission Parameters

When using this tool to model the spread of a specific viral respiratory pathogen, 
you need to choose parameters that accurately reflect the characteristics of that 
pathogen. The default parameters are set to reflect central estimates for COVID-19
in early 2020, but you can adjust these values to model other pathogens or 
variations in disease behaviour. By changing these parameters in the tool, users 
can also explore the impact of each parameter on epidemic dynamics and the effectiveness
of NPIs.

### B. NPI Effects

The tool allows the user to explore the potential impact of NPIs and how 
effective they are, and explore their potential impact for a range of 
disease profiles. The NPIs available to model work in the following ways:

 - **1. Reducing transmission amongst contacts:** This could represent measures like
  social distancing and mask wearing, which make it harder 
  for the virus to spread from one person to another.
- **2. Reducing contact rates for specific age groups:** Some measures 
  target particular age groups to reduce their exposure, such as closing 
  schools or protecting older adults by reducing interactions between 
  different generations. Lockdowns, which impact all age groups, would reduce
  contact rates amongst all ages.
- **3. Reducing infectiousness of those who are sick:** This focuses on 
  lowering the chance that someone with the virus will pass it on to 
  others. It might involve isolating people with symptoms or ensuring 
  those who test positive stay at home.
- **4. Reducing the importation of new cases:** This intervention reduces 
  the number of infections brought into a community from outside, such 
  as through travel restrictions or quarantine for people entering the 
  country.

The user can also specify the time at which NPIs are implemented, and how 
effective they are, and explore their potential impact for a range of 
disease profiles.

#### B.2. NPI Effect Parameters

The impact that each NPI will have depends on a number of factors (the severity 
of the pathogen, the level of public adherence with guidelines, the stringency 
of restrictions etc). The estimates provided in the table below provide a range 
for the impact of different interventions for COVID-19 if implemented on their own.

------------------------------------------------------------------------

|              Category of Intervention              |         Broad NPI Category          |             Intervention              |     Range of Impact (Reduction)      |                   Reference                   |
|:-------------:|:-------------:|:-------------:|:-------------:|:-------------:|
|     **Reducing transmission amongst contacts**      |          Social Distancing          |      Lockdowns (Partial - Full)       |                30-80%                |   Davies et al., 2020; Flaxman et al., 2020   |
|                                                    |          Social Distancing          |      Social Distancing (General)      |                15-45%                |    Haug et al., 2020; Brauner et al., 2021    |
|                                                    |          Social Distancing          |   Limiting Gatherings (Event Bans)    |                15-45%                |  Flaxman et al., 2020; Brauner et al., 2021   |
|                                                    | Business and Workplace Restrictions |          Workplace Closures           |                15-50%                |  Flaxman et al., 2020; Brauner et al., 2021   |
|     **Reduction to (Age) Group Contact Rates**     |        Educational Measures         |            School Closures            | 20-60% (amongst school age children) |    Viner et al., 2020; Davies et al., 2020    |
|                                                    |          Social Distancing          | Curfews / Restricted Operating Hours  |                10-25%                |    Brauner et al., 2021; Haug et al., 2020    |
|                                                    |         Targeted Protection         |  Age-Based Shielding (E.g., Elderly)  |   30-50% (for specific age group)    |    Davies et al., 2020; Haug et al., 2020     |
| **Reduction in Infectiousness of a Disease State** |    Personal Protective Measures     |         Mask-Wearing Mandates         |                10-30%                |    Chu et al., 2020; Brauner et al., 2021     |
|                                                    |           Case Isolation            |    Isolation of Symptomatic Cases     |                40-70%                |  Davies et al., 2020; Kucharski et al., 2020  |
|                                                    |   Contact Tracing and Quarantine    |        Quarantine of Contacts         |                30-60%                | Ferretti et al., 2020; Hellewell et al., 2020 |
|         **Reduction to Importation Rate**          |         Travel Restrictions         | Travel Restrictions / Border Controls |                10-50%                |    Grépin et al., 2021; Haug et al., 2020     |

### B.2. How To Choose NPI Effect Parameters

The impact that each NPI will have depends on a number of factors (the epidemiological 
parameters of the pathogen, the level of public adherence with guidelines, the stringency 
of restrictions etc). While many of these interventions were implemented during 
the UK response to the COVID-19 pandemic, accurately estimating the impact of 
different interventions on disease transmission is a challenging task. This is 
because often interventions were implemented at the same time as other interventions, 
making it harder to quantify the contribution of each intervention, and some 
interventions, like lockdowns, inherently encompass others, such as school and 
workplace closures. The estimates provided in the table above therefore reflect 
current best estimates of the impact of each NPI if implemented in isolation.

The default NPI parameters are set to 0 to reflect an unmitigated epidemic. When 
using this tool to model the impact of NPI, you need to choose parameters 
that reflect the total impact of NPIs in each of the four intervention categories. 
To help users understand how to choose these values, we have provided a worked to
reflect the implementation of the following NPI interventions 14 days after the first
individual is admitted to hospital with severe disease:

* Work-from home order - 60% of workforce able to work-from home
* School closures - All school-aged individuals assumed to have 80% fewer contacts 
* Mask mandate - 50% of population adhere to mask mandate 
* Symptomatic cases to self-isolate - 50% of symptomatic cases adhere to policy
* Border controls - Reduces importations by 30%

- **1. Reducing transmission amongst contacts:** 

This could represent measures like 
  lockdowns or restrictions that apply to everyone, which make it harder 
  for the virus to spread from one person to another.
- **2. Reducing contact rates for specific age groups:** Some measures 
  target particular age groups to reduce their exposure, such as closing 
  schools or protecting older adults by reducing interactions between 
  different generations.
- **3. Reducing infectiousness of those who are sick:** This focuses on 
  lowering the chance that someone with the virus will pass it on to 
  others. It might involve isolating people with symptoms or ensuring 
  those who test positive stay at home.
- **4. Reducing the importation of new cases:** This intervention reduces 
  the number of infections brought into a community from outside, such 
  as through travel restrictions or quarantine for people entering the 
  country.

The default 
parameters are set to 0 to reflect an unmitigated epidemic. reflect central estimates for NPI effectiveness on COVID-19 
in early 2020 and are assumed to be implemented 14 days after the first patient 
admitted to hospital with severe disease. These estimates reflect the following  , ibut you can adjust these values to model other pathogens or 
variations in disease behaviour. To do so, it is helpful to consider how each 
parameter influences transmission and severity, using the information provided 
in the tool as guidance.NPI effect estimates, While some studies, like the one by Sharma 
et al. (Nature Communications, 2021), attempt to isolate the effects of individual NPIs, 
there is no comprehensive approach or study that can account for the full range of 
interventions and estimate their combined impact on transmission. Therefore the 
table above is provided to help provide an indication of the range of impacts 
that an individual NPI could have and guide the user when selecting a value for 
each of the NPI intervention levers. Given the difficulty of deciding on a 
specific estimate for each of the levers, especially when considering different 
respiratory viral pathogens (most of these interventions have only been studied 
in the context of COVID-19), the “Sensitivity” tab allows users to compare the 
impact of different NPIs.