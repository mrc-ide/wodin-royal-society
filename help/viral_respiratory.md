# **Modelling Non-Pharmaceutical Interventions for Viral Respiratory Pathogens**

## **Introduction**

Non-pharmaceutical interventions (NPIs) are actions, apart from getting vaccinated and taking medicine, that people and communities can take to help slow the spread of illnesses like pandemic influenza or COVID-19. These actions include things like social distancing, mask-wearing, and quarantining.

## **Modelling Non-Pharmaceutical Interventions**

This tool enables the user to explore the potential impact of a range of non-pharmaceutical interventions (NPIs) on a potential outbreak of a viral respiratory pathogen.

### **1. Disease Transmission**

The tool simulates how a respiratory virus spreads within an age-structured population. People start in the “susceptible” category (S), meaning they are healthy but at risk of catching the disease. If they are exposed to someone infectious, they move into the “exposed” group (E), where they carry the virus but are not yet symptomatic. From here, they either develop symptoms and move into the “symptomatic infected” group (I), or they stay without symptoms and move into the “asymptomatic” group (A). Asymptomatic individuals all eventually recover (R), but symptomatic people might be hospitalized (H), and hospitalized people can either recover (R) or die (D). The age of an individual impacts their risk of different disease outcomes as well as the impact of different NPIs. The model tracks and outputs how many people are in each disease stage over time.

**INSERT COMPARTMENTAL FIGURE HERE**

#### **1. Disease Transmission Parameters**

Infectious disease models are designed to mirror the specific biological and epidemiological characteristics of a pathogen. This process, known as parameterisation, involves setting key parameters that capture how a disease spreads, how quickly it progresses, and how it affects different segments of the population. For respiratory viruses, like COVID-19, a number of different parameters need to be parameterised to accurately reflect how the virus behaves and to predict its impact.

---

|Model Code |Parameter | Definition                                      |
|---------:|:--------|:----------------------------------------------------------|
| **A0** | **Importation Rate** | The rate at which new cases of a disease are introduced into a population from external sources, such as international travel or movement between regions. The importation rate will determine the need for interventions like border controls or quarantines. |
| **A1** | **$R_0$ (Basic Reproduction Number)** | The average number of secondary infections caused by one infected individual in a fully susceptible population. A higher $R_0$ implies a more contagious pathogen with greater transmissibility. |
| **A2** | **Incubation Period** | The time between exposure to the pathogen and the onset of symptoms. This period determines how quickly a pathogen spreads and the duration of self-isolation policies after infectious contact.  |
| **A3** | **Percentage of Incubation Period Infectious** | The proportion of the incubation period during which an infected person is capable of transmitting the pathogen. This is critical for designing intervention policies and the need for diagnostic testing. |
| **A4** | **Proportion of Asymptomatic Infections** | The percentage of infected individuals who do not show symptoms but can still transmit the pathogen. This affects the overall transmission dynamics and the need for diagnostic testing.  |
| **A5** | **Symptomatic Period** | The duration during which an infected individual exhibits symptoms of the disease. Longer symptomatic periods will require longer case isolation policies to prevent onward spread of infections. |
| **A6 \- A8** | **Severity by Age (IHR/IFR)** | Infection Hospitalisation Rate (IHR) and Infection Fatality Rate (IFR) describe the likelihood of an individual requiring hospital care or dying from the infection, often varying by age group and other individual risk factors. |

---

Different pathogens have distinct characteristics in terms of transmission dynamics, incubation periods, and severity, highlighted by comparing three notable viral respiratory pathogens: Severe Acute Respiratory Syndrome coronavirus 1 (SARS-1), influenza, and Respiratory Syncytial Virus (RSV). The table below summarises key epidemiological parameters for each respiratory viral pathogen.

---

| Pathogen | $R_0$ | Incubation Period | Symptomatic Period | Percentage of Incubation Period Infectious | Proportion of Asymptomatic Infections | IFR | IHR |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **SARS-1** | \~2-3 [1] | \~4-6 days [2] | \~7-21 days [3,4] | \~0-10% [1] | \<5% [5] | \~9-15% [6] | \~100% [7] |
| **Influenza** | \~1-2 [8] | \~1-4 days [9] | \~3-7 days [10] | \~25-50% [11] | \~15-75%\* [12,13] | \~0.01 \- 0.1%\*\*  [14,15] | \~0.0002% \- 0.0007% [16] |
| **RSV** | \~1-3 [17,18] | \~3-6 days [17,19] | \~7-12 days  [20,21] | \~0-10% [22]  | \~20-40%\*\*\* [23,24] | \<0.1% [25] | \~1-3%\*\*\* [26] |

\* Varies by strain and study  
\*\* 1918 H1N1 IFR \~2%  
\*\*\* Proportion of infections that are symptomatic and proportion of infections requiring hospitalisation higher in children and elderly adults  

---

These parameters illustrate the differences in transmission dynamics and severity across pathogens, and help understand how to design appropriate public health strategies. For example, SARS-1 could be effectively controlled through isolating symptomatic individuals due to the limited pre-symptomatic transmission. On the other hand, influenza’s shorter incubation period and higher pre-symptomatic transmission requires broader interventions to reduce spread. RSV's higher $R_0$, in combination with increased rates of pre-symptomatic transmission amongst children necessitates targeted paediatric responses. The combination of each parameter will determine how difficult the spread of the pathogen is to control.

### **2. How To Choose Disease Transmission Parameters**

When using this tool to model the spread of a specific viral respiratory pathogen, you need to choose parameters that accurately reflect the characteristics of that pathogen. The default parameters are set to reflect central estimates for COVID-19 in early 2020, but you can adjust these values to model other pathogens or variations in disease behaviour. By changing these parameters in the tool, users can also explore the impact of each parameter on epidemic dynamics and the effectiveness of NPIs.

### **3. NPI Effects**

The tool allows the user to explore the potential impact of NPIs and how effective they are, and explore their potential impact for a range of disease profiles. The model code for the NPIs available to model work in the following ways, with the model code included.:

- **B1. Reducing transmission amongst contacts:** This could represent measures like social distancing and mask wearing, which make it harder for the virus to spread from one person to another.  
- **B2. Reducing contact rates for specific age groups:** Some measures target particular age groups — **B2a**: Under 18s, **B2b**: 18-65, **B2c**: Over 65s — to reduce their exposure, such as closing schools or protecting older adults by reducing interactions between different generations. Lockdowns, which impact all age groups, would reduce contact rates amongst all ages.  
- **B3. Reducing infectiousness of those who are sick:** This focuses on lowering the chance that someone with the virus will pass it on to others. This includes **B3a** \- isolating people with symptoms and **B3b** \- ensuring those who test positive stay at home.  
- **B4. Reducing the importation of new cases:** This intervention reduces the number of infections brought into a community from outside, such as through travel restrictions or quarantine for people entering the country.

The user can also specify the time at which NPIs are implemented, and how effective they are, and explore their potential impact for a range of disease profiles.

#### **3. NPI Effect Parameters**

The impact that each NPI will have depends on a number of factors (the severity of the pathogen, the level of public adherence with guidelines, the stringency of restrictions etc). The estimates provided in the table below provide a range for the impact of different interventions for COVID-19 if implemented on their own.

---

| Category of Intervention | Broad NPI Category | Intervention | Range of Impact (Reduction) | Reference |
| ---: | :--- | ----- | :---: | :---: |
| **Reducing transmission amongst contacts** | Protection Measures | Face Coverings (Masks) | 20% | Boulos et al., 2023 Review |
|  |  | Respirators (N95, KN95, FFP2) | 30% | Boulos et al., 2023 Review |
|  | Individual Behavioural | Hand Hygiene | 10% | Gozdielewska et al., 2022 |
|  |  | Respiratory Etiquette | 15% | 2021 NHS Scotland Literature Review |
|  | Community Measures | Physical Distancing | 15% | Murphy et al., 2023 Review |
|  |  | Encouraging Outdoor Meetings | 25% | Murphy et al., 2023 Review |
| **Reducing contact rates for specific age groups** | Community Measures | Lockdowns (Partial \- Full) | 30-80% | Davies et al., 2020; Flaxman et al., 2020 |
|  |  | School Measures and Closures | 20% | Murphy et al., 2023 Review |
|  |  | Work at home orders | 25% | Beck et al 2020 |
|  |  | Public Event Cancellations | 25% | Brauner et al 2021 |
| **Reducing infectiousness of those who are sick** | Community Measures | Symptomatic or Positive Test Self-Isolation | 25% | Murphy et al., 2023 Review |
|  | Testing Measures | Mass Testing | 30% | Littlecott et al., 2023 Review |
|  |  | Contact Tracing | 30% | Littlecott et al., 2023 Review |
| **Reducing the importation of new cases** | Travel Restrictions | Border Closures | 20% | Grépin et al., 2023 Review |
|  |  | Entry Screening and Quarantine for Travellers | 20% | Grépin et al., 2023 Review |

### 

#### **4. How To Choose NPI Effect Parameters**

The impact that each NPI will have depends on a number of factors (the epidemiological parameters of the pathogen, the level of public adherence with guidelines, the stringency of restrictions etc). While many of these interventions were implemented during the UK response to the COVID-19 pandemic, accurately estimating the impact of different interventions on disease transmission is a challenging task. This is because often interventions were implemented at the same time as other interventions, making it harder to quantify the contribution of each intervention, and some interventions, like lockdowns, inherently encompass others, such as school and workplace closures. The estimates provided in the table above therefore reflect current best estimates of the impact of each NPI **if implemented in isolation**.

The default NPI parameters in the tool are set to 0 to reflect an unmitigated epidemic. When using this tool to model the impact of NPI, you need to choose parameters that reflect the total impact of NPIs in each of the four intervention categories. To help users understand how to choose these values, we have provided a worked example to reflect the implementation of the following NPI interventions and possible parameter values for the tool:

* **Work-from home order** \- 60% of workforce able to work-from home:  
  - Assumed 25% reduction in transmission for those who can work from home  
  - B2b set equal to 0.15 (60% of 25% effect)

* **School closures** \- 20% of school-aged individuals still interact with other children:  
  - Assumed 20% reduction in transmission amongst children  
  - B2a set equal to 0.16 (80% of 20% effect)

* **Mask mandate** \- 50% of population adhere to mask mandate:  
  - Assumed 20% reduction in transmission amongst all contacts  
  - B1 set equal to 0.1 (50% of 20% effect)

* **Symptomatic cases to self-isolate** \- 50% of symptomatic cases adhere to policy:  
  - Assumed 25% reduction in transmission amongst all contacts  
  - B3a set equal to 0.125 (50% of 25% effect)

* **Border controls** \- Only 80% of incoming travel is impacted:  
  - Assumed 20% reduction in importations  
  - B4 set equal to 0.16 (80% of 20% effect)

* **NPI delay** \-  NPIs implemented 14 days after the first hospitalisation with severe disease:  
  - B5 set equal to 14

The suite of interventions above was chosen as the impact of each intervention will mostly affect one component of transmission. However, introduction of the above suite of interventions is likely to change human behaviour more broadly. For example, individuals may change their personal behaviours to reduce their own risk, especially if the suite of interventions conveys that the pathogen threat is serious. As a result there may be a greater reduction in transmission amongst contacts. Alternatively, individuals may show lower adherence with these interventions given that the epidemic is in its early stages and there have been limited hospitalisations and deaths.

---

Ultimately, deciding on the correct parameters is not the aim when using this tool. The tool and the accompanying guidance allow users to explore how both the epidemiology of the pathogen and the combination of implemented NPIs determine how difficult the spread of the pathogen is to control. Exploring these processes, by changing the parameters used and observing the change in public health outcomes, will provide a greater understanding of epidemic dynamics and the timeliness and impact of different NPIs.

### **References** 

[1]: Lipsitch M, Cohen T, Cooper B, et al. Transmission dynamics and control of severe acute respiratory syndrome. Science 2003;300(5627):1966–1970; doi:  [10.1126/science.1086616](http://dx.doi.org/10.1126/science.1086616)
 
[2]: Donnelly CA, Ghani AC, Leung GM, et al. Epidemiological determinants of spread of causal agent of severe acute respiratory syndrome in Hong Kong. Lancet 2003;361(9371):1761–1766; doi:  [10.1016/S0140-6736(03)13410-1](http://dx.doi.org/10.1016/S0140-6736\(03\)13410-1)
 
[3]: Peiris JSM, Lai ST, Poon LLM, et al. Coronavirus as a possible cause of severe acute respiratory syndrome. Lancet 2003;361(9366):1319–1325; doi:  [10.1016/s0140-6736(03)13077-2](http://dx.doi.org/10.1016/s0140-6736\(03\)13077-2)
 
[4]: Lee N, Hui D, Wu A, et al. A major outbreak of severe acute respiratory syndrome in Hong Kong. N Engl J Med 2003;348(20):1986–1994; doi:  [10.1056/NEJMoa030685](http://dx.doi.org/10.1056/NEJMoa030685)
 
[5]: Leung GM, Hedley AJ, Ho L-M, et al. The epidemiology of severe acute respiratory syndrome in the 2003 Hong Kong epidemic: an analysis of all 1755 patients. Ann Intern Med 2004;141(9):662–673; doi:  [10.7326/0003-4819-141-9-200411020-00006](http://dx.doi.org/10.7326/0003-4819-141-9-200411020-00006)

[6]: World Health Organization. Consensus Document on the Epidemiology of Severe Acute Respiratory Syndrome (‎SARS)‎. World Health Organization; 2003\.]

[7]: Severe Acute Respiratory Syndrome \--- Taiwan, 2003\. 2003\. Available from:]  [https://www.cdc.gov/mmwr/preview/mmwrhtml/mm5220a1.htm](https://www.cdc.gov/mmwr/preview/mmwrhtml/mm5220a1.htm) (Last accessed: 10/8/2024)

[8]: Biggerstaff M, Cauchemez S, Reed C, et al. Estimates of the reproduction number for seasonal, pandemic, and zoonotic influenza: a systematic review of the literature. BMC Infect Dis 2014;14(1):480; doi:  [10.1186/1471-2334-14-480](http://dx.doi.org/10.1186/1471-2334-14-480)

[9]: Lessler J, Reich NG, Brookmeyer R, et al. Incubation periods of acute respiratory viral infections: a systematic review. Lancet Infect Dis 2009;9(5):291–300; doi:  [10.1016/S1473-3099(09)70069-6](http://dx.doi.org/10.1016/S1473-3099\(09\)70069-6)

[10]: Carrat F, Vergu E, Ferguson NM, et al. Time lines of infection and disease in human influenza: a review of volunteer challenge studies. Am J Epidemiol 2008;167(7):775–785; doi:  [10.1093/aje/kwm375](http://dx.doi.org/10.1093/aje/kwm375)

[11]: Cowling BJ, Chan KH, Fang VJ, et al. Comparative epidemiology of pandemic and seasonal influenza A in households. N Engl J Med 2010;362(23):2175–2184; doi:  [10.1056/NEJMoa0911530](http://dx.doi.org/10.1056/NEJMoa0911530)

[12]: Hayward AC, Fragaszy EB, Bermingham A, et al. Comparative community burden and severity of seasonal and pandemic influenza: results of the Flu Watch cohort study. Lancet Respir Med 2014;2(6):445–454; doi:  [10.1016/S2213-2600(14)70034-7](http://dx.doi.org/10.1016/S2213-2600\(14\)70034-7)

[13]: Leung NHL, Xu C, Ip DKM, et al. Review article: The fraction of influenza virus infections that are asymptomatic: A systematic review and meta-analysis. Epidemiology 2015;26(6):862–872; doi:  [10.1097/EDE.0000000000000340](http://dx.doi.org/10.1097/EDE.0000000000000340)

[14]: Paget J, Spreeuwenberg P, Charu V, et al. Global mortality associated with seasonal influenza epidemics: New burden estimates and predictors from the GLaMOR Project. J Glob Health 2019;9(2):020421; doi:  [10.7189/jogh.09.020421](http://dx.doi.org/10.7189/jogh.09.020421)

[15]: World Health Assembly. Implementation of the International Health Regulations (‎2005)‎: Report of the Review Committee on the Functioning of the International Health Regulations (‎2005)‎ in Relation to Pandemic (‎H1N1)‎ 2009: Report by the Director-General. World Health Organization; 2011\.]

[16]: Paget J, Staadegaard L, Wang X, et al. Global and national influenza-associated hospitalisation rates: Estimates for 40 countries and administrative regions. J Glob Health 2023;13(04003):04003; doi:  [10.7189/jogh.13.04003](http://dx.doi.org/10.7189/jogh.13.04003)

[17]: Wang X, Li Y, Shi T, et al. Global disease burden of and risk factors for acute lower respiratory infections caused by respiratory syncytial virus in preterm infants and young children in 2019: a systematic review and meta-analysis of aggregated and individual participant data. Lancet 2024;403(10433):1241–1253; doi:  [10.1016/S0140-6736(24)00138-7](http://dx.doi.org/10.1016/S0140-6736\(24\)00138-7)

[18]: Reis J, Shaman J. Retrospective parameter estimation and forecast of respiratory syncytial virus in the United States. PLoS Comput Biol 2016;12(10):e1005133; doi:  [10.1371/journal.pcbi.1005133](http://dx.doi.org/10.1371/journal.pcbi.1005133)

[19]: Welliver RC. Review of epidemiology and clinical risk factors for severe respiratory syncytial virus (RSV) infection. J Pediatr 2003;143(5 Suppl):S112–7; doi:  [10.1067/s0022-3476(03)00508-0](http://dx.doi.org/10.1067/s0022-3476\(03\)00508-0)
 [20]: Hall CB. Respiratory syncytial virus and parainfluenza virus. N Engl J Med 2001;344(25):1917–1928; doi:  [10.1056/NEJM200106213442507](http://dx.doi.org/10.1056/NEJM200106213442507)

[21]: Munywoki PK, Koech DC, Agoti CN, et al. Influence of age, severity of infection, and co-infection on the duration of respiratory syncytial virus (RSV) shedding. Epidemiol Infect 2015;143(4):804–812; doi:  [10.1017/S0950268814001393](http://dx.doi.org/10.1017/S0950268814001393)

[22]: Hall CB, Douglas RG Jr, Schnabel KC, et al. Infectivity of respiratory syncytial virus by various routes of inoculation. Infect Immun 1981;33(3):779–783; doi:  [10.1128/iai.33.3.779-783.1981](http://dx.doi.org/10.1128/iai.33.3.779-783.1981)

[23]: Munywoki PK, Koech DC, Agoti CN, et al. Frequent asymptomatic respiratory syncytial virus infections during an epidemic in a rural Kenyan household cohort. J Infect Dis 2015;212(11):1711–1718; doi:  [10.1093/infdis/jiv263](http://dx.doi.org/10.1093/infdis/jiv263)

[24]: Hall CB, Weinberg GA, Iwane MK, et al. The burden of respiratory syncytial virus infection in young children. N Engl J Med 2009;360(6):588–598; doi:  [10.1056/NEJMoa0804877](http://dx.doi.org/10.1056/NEJMoa0804877)

[25]: Shi T, McAllister DA, O’Brien KL, et al. Global, regional, and national disease burden estimates of acute lower respiratory infections due to respiratory syncytial virus in young children in 2015: a systematic review and modelling study. Lancet 2017;390(10098):946–958; doi:  [10.1016/S0140-6736(17)30938-8](http://dx.doi.org/10.1016/S0140-6736\(17\)30938-8)

[26]: Wildenbeest JG, Billard M-N, Zuurbier RP, et al. The burden of respiratory syncytial virus in healthy term-born infants in Europe: a prospective birth cohort study. Lancet Respir Med 2023;11(4):341–353; doi:  [10.1016/S2213-2600(22)00414-3](http://dx.doi.org/10.1016/S2213-2600\(22\)00414-3)
