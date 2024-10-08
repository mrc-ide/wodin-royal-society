<h3 align="center">

**Infectious disease models to support decisions on non-pharmaceutical interventions (NPIs) for future pathogens with pandemic potential**

</h3>

---

<button onclick="window.location.href='#list-of-available-models';" style = "background: aliceblue; border-radius: 5px; border-color: azure">
List of Available Models
</button>

---

### **Aim of infectious disease modelling**

Infectious disease modelling plays a crucial role in understanding and predicting the spread of pathogens. The primary purpose of these models is to capture how an infectious disease spreads through a population and to provide insight into how various interventions might alter the course of an outbreak. By simulating different scenarios, models allow us to evaluate the potential impact of measures such as isolation and quarantine. These insights are particularly valuable in shaping public health responses during an outbreak, guiding decisions that aim to mitigate the spread of a new pathogen and reduce its impact on the population.

### **What are infectious disease models?**

The framework of infectious disease models is built upon assumptions about how individuals move through different stages of infection and how they interact with others in a population. These models aim to capture the transition of individuals between health states – such as being susceptible to infection, becoming infected, and eventually recovering or remaining infectious – and to represent how these transitions contribute to the overall spread of the disease. The models use these assumptions to describe and predict the dynamics of an outbreak, allowing public health officials to understand how an infectious disease progresses over time within a community.

In addition to understanding disease dynamics, models are powerful tools for assessing the potential impact of interventions. They can be used to simulate a variety of non-pharmaceutical interventions (NPIs), such as social distancing, isolation, and quarantine, and their effects on disease spread. For example, models help to determine how effective isolating symptomatic individuals might be in reducing transmission, or how measures like lockdowns that reduce social contact can slow the rate of new infections. By exploring different intervention strategies and their likely outcomes, models provide essential insights into the most effective ways to control and mitigate the impact of infectious diseases.

### **What models are available in this tool?**

Infectious disease models are designed to mirror the specific biological and epidemiological characteristics of the pathogen that they model. Due to these different characteristics, a specific infectious disease model is often needed to accurately capture the dynamics of the pathogen. Further, depending on the needs of the policy maker, often variations and increased complexity is needed to meet these needs, for example, adding in care homes to model the spread of COVID-19 within this specific high-risk sub-group of the population. As a result, there are many different infectious disease models available in the literature, however, often these share common compartments and themes.   

In this tool, we aim to provide a range of models to fit to different policy makers needs. This will include providing specific models, which are tailored for a particular pathogen or range of NPIs (Tailored Models). Alternatively, often pathogens can be grouped in terms of their method of transmission (viral respiratory, blood borne etc) and the types of NPI used to control their spread. For this reason, this tool also includes a set of generalist models that are able to accommodate a wider range of policy needs while being less complex and prescriptive about model parameters (Generalist Models).  

#### **List of Available Models**

##### **Generalist Models**

* [Respiratory Viral Pathogen](apps/npi)

##### **Tailored Models**

* To be added

### **Guide on how to use infectious disease models**

Infectious disease models are designed to mirror the specific biological and epidemiological characteristics of a pathogen. This process, known as parameterisation, involves setting key parameters that capture how a disease spreads, how quickly it progresses, and how it affects different segments of the population. While different models include different epidemiological processes and will require specific parameters, we have included a list of infectious disease parameters most commonly relevant for infectious disase modelling.

------------------------------------------------------------------------

|                   Parameter                    |                                                                                                                     Definition                                                                                                                      |
|:----------------------------------:|:----------------------------------:|
|       **R0 (Basic Reproduction Number)**       |                  Measures how contagious a pathogen is by indicating the average number of secondary infections caused by one infected individual in a fully susceptible population. A higher R0 implies greater transmissibility.                  |
|             **Incubation Period**              |                     The time between exposure to the pathogen and the onset of symptoms. This period determines how quickly a pathogen spreads and can influence how long an individual is infectious before symptoms develop.                      |
|             **Symptomatic Period**             |               The duration during which an infected individual exhibits symptoms of the disease. The length of this period can affect the likelihood of identifying and isolating cases, influencing the success of control measures.               |
| **Percentage of Incubation Period Infectious** | The proportion of the incubation period during which an infected person is capable of transmitting the pathogen. This is critical for understanding the potential for pre-symptomatic transmission and designing effective intervention strategies. |
|   **Proportion of Asymptomatic Infections**    |                              The percentage of infected individuals who do not show symptoms but can still transmit the pathogen. This affects the overall transmission dynamics and may complicate control measures.                               |
|         **Severity by Age (IHR/IFR)**          |         Infection Hospitalisation Rate (IHR) and Infection Fatality Rate (IFR) describe the likelihood of an individual requiring hospital care or dying from the infection, often varying by age group and other individual risk factors.          |

### **5. Guide on how to use the modelling interface?**

<button onclick="window.location.href='#list-of-available-models';" style = "background: aliceblue; border-radius: 5px; border-color: azure">
Intro to wodin to be added!
</button>