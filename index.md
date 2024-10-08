<h3 align="center" style="padding: 30px 20px 20px 20px; color: #d31346;  margin-top: 20px">

**Infectious disease models to support decisions on non-pharmaceutical interventions (NPIs) for future pathogens with pandemic potential**

</h3>

<hr style="border:2px solid gray">

This tool is designed to help users explore the potential impacts of non-pharmaceutical interventions (NPIs) on the spread of a future pandemic threat. The tool provides various mathematical models for exploring the impact of NPIs on different types of infectious diseases. The tool provides a framework for exploring how the transmission dynamics for different pathogen types determine the effectiveness of NPIs to control the spread of a future pathogen with pandemic potential. When using the tool, you should adjust parameters thoughtfully to fit the pathogen of interest. While the tool provides a foundation for understanding the potential effects of NPIs, it will not be able to account for every real-world variable and should only be used to guide decisions and further understanding on the impact of NPIs on the spread of an emerging infectious disease threat.

<!-- 
<div style="text-align: center;">
<button onclick="window.location.href='#generalist-models';" style="background: aliceblue; border-radius: 5px; border-color: azure;">
Go To List of Available Models
</button>
</div>
-->

---

### **Aim of infectious disease modelling**

Infectious disease modelling plays a crucial role in understanding and predicting the spread of pathogens. The primary purpose of these models is to capture how an infectious disease spreads through a population and to provide insight into how various interventions might alter the course of an outbreak. By simulating different scenarios, models allow us to evaluate the potential impact of measures such as isolation and quarantine. These insights are particularly valuable in shaping public health responses during an outbreak, guiding decisions that aim to mitigate the spread of a new pathogen and reduce its impact on the population.

### **What are infectious disease models?**

Infectious disease models are built upon a framework of assumptions about how individuals move through different stages of infection and how they interact with others in a population. These models aim to capture the transition of individuals between health states – such as being susceptible to infection, becoming infected (and therefore infectious to others), before either recovering or experiencing more severe outcomes, such as hospitaliation and/or death. The models represent how these individual transitions between health states contribute to the overall spread of the disease; at every point in an epidemic, the number of new infections that occur is determined by: the current number of infectious individuals, the current number that are susceptible to infection, and the way that these populations interact with each other. The models use these assumptions to describe and predict the dynamics of an outbreak, allowing public health officials to understand how an infectious disease progresses over time within a community.

In addition to understanding disease dynamics, models are powerful tools for assessing the potential impact of interventions. They can be used to simulate a variety of non-pharmaceutical interventions (NPIs), such as social distancing, shielding, and quarantine, and their effects on disease spread. For example, models help to determine how effective isolating symptomatic individuals might be in reducing transmission, or how measures like lockdowns that reduce social contact can slow the rate of new infections. By exploring different intervention strategies and their likely outcomes, models provide essential insights into the most effective ways to control and mitigate the impact of infectious diseases.

### **What models are available in this tool?**

Infectious disease models are designed to mirror the specific biological and epidemiological characteristics of the pathogen that they model. Due to these different characteristics, a tailored infectious disease model is often needed to accurately capture the dynamics of the pathogen. Further, depending on the needs of the policy maker, often variations and increased complexity is needed to meet these needs, for example, adding in care homes to model the spread of COVID-19 within this specific high-risk sub-group of the population. As a result, there are many different infectious disease models available in the literature, however, often these share common compartments and themes.   

In this tool, we aim to provide a range of models to fit to different policy makers' needs. This will include providing specific models, which are tailored for a particular pathogen or range of NPIs (**Tailored Models**). Alternatively, often pathogens can be grouped in terms of their method of transmission (viral respiratory, blood borne etc) and the types of NPI used to control their spread. For this reason, this tool also includes a set of generalist models that are able to accommodate a wider range of policy needs while being less complex and prescriptive about model parameters (**Generalist Models**). 

---

##### **Generalist Models:**

<button onclick="window.location.href='apps/viral_respiratory';" style = "background: aliceblue; border-radius: 5px; border-color: azure">
Respiratory Transmission
</button>
<button onclick="window.location.href='';" style = "background: aliceblue; border-radius: 5px; border-color: azure">
Food and Water Transmission Route
</button>
<button onclick="window.location.href='';" style = "background: aliceblue; border-radius: 5px; border-color: azure">
Vector-borne
</button>
<button onclick="window.location.href='';" style = "background: aliceblue; border-radius: 5px; border-color: azure">
Physical Contact Transmission
</button>
<button onclick="window.location.href='';" style = "background: aliceblue; border-radius: 5px; border-color: azure">
Sexual or Blood-borne
</button>

---

##### **Tailored Models:**


| **Respiratory Viral Pathogens** | **Food and Water Transmission Route** | **Vector-borne** | **Physical Contact Transmission** | **Sexual or Blood-borne** |
|:-----------------------------:|:-----------------------------:|:-----------------------------:|:-----------------------------:|:-----------------------------:|
| <button onclick="window.location.href='apps/sars-cov-1';" style="background: aliceblue; border-radius: 5px; border-color: azure;">SARS-CoV-1</button> | <button onclick="window.location.href='apps/cholera';" style="background: aliceblue; border-radius: 5px; border-color: azure;">Cholera</button> | <button onclick="window.location.href='apps/dengue';" style="background: aliceblue; border-radius: 5px; border-color: azure;">Dengue</button> | <button onclick="window.location.href='apps/dengue';" style="background: aliceblue; border-radius: 5px; border-color: azure;">Scabies</button> | <button onclick="window.location.href='apps/hiv';" style="background: aliceblue; border-radius: 5px; border-color: azure;">HIV</button> |
| <button onclick="window.location.href='apps/rsv';" style="background: aliceblue; border-radius: 5px; border-color: azure;">RSV</button> | <button onclick="window.location.href='apps/norovirus';" style="background: aliceblue; border-radius: 5px; border-color: azure;">Norovirus</button> | <button onclick="window.location.href='apps/zika';" style="background: aliceblue; border-radius: 5px; border-color: azure;">Zika</button> | <button onclick="window.location.href='apps/zika';" style="background: aliceblue; border-radius: 5px; border-color: azure;">Mpox</button> | <button onclick="window.location.href='apps/hpv';" style="background: aliceblue; border-radius: 5px; border-color: azure;">HPV</button> |
| <button onclick="window.location.href='apps/influenza';" style="background: aliceblue; border-radius: 5px; border-color: azure;">Influenza</button> | <button onclick="window.location.href='apps/e-coli';" style="background: aliceblue; border-radius: 5px; border-color: azure;">E. coli</button> | <button onclick="window.location.href='apps/lyme-disease';" style="background: aliceblue; border-radius: 5px; border-color: azure; vertical-align: middle;">Lyme Disease</button> |  | <button onclick="window.location.href='apps/hepatitis-b';" style="background: aliceblue; border-radius: 5px; border-color: azure; vertical-align: middle;">Hepatitis B</button> |
| <button onclick="window.location.href='apps/sars-cov-2';" style="background: aliceblue; border-radius: 5px; border-color: azure;">SARS-CoV-2</button> | <button onclick="window.location.href='apps/hepatitis-a';" style="background: aliceblue; border-radius: 5px; border-color: azure;">Hepatitis A</button> |  |  |  |

---

### **Infectious disease model parameters**

Infectious disease models are designed to mirror the specific biological and epidemiological characteristics of a pathogen. This process, known as parameterisation, involves setting key parameters that capture how a disease spreads, how quickly it progresses, and how it affects different segments of the population. While different models include different epidemiological processes and will require specific parameters, we have included a list of infectious disease parameters most commonly relevant for infectious disase modelling.

|  Parameter  |  Definition  |
|----------------------------------:|:------------------------------------------------------------------|
|       **R<sub>0</sub> (Basic Reproduction Number)**       |                  Measures how transmissible a pathogen is by indicating the average number of secondary infections caused by one infected individual in a fully susceptible population. A higher R<sub>0</sub> implies greater transmissibility.                  |
|             **Incubation Period**              |                     The time between exposure to the pathogen and the onset of symptoms. This period determines how quickly a pathogen spreads and can influence how long an individual is infectious before symptoms develop.                      |
|             **Symptomatic Period**             |               The duration during which an infected individual exhibits symptoms of the disease. The length of this period can affect the likelihood of identifying and isolating cases, influencing the success of control measures.               |
| **Percentage of Incubation Period Infectious** | The proportion of the incubation period during which an infected person is capable of transmitting the pathogen. This is critical for understanding the potential for pre-symptomatic transmission and designing effective intervention strategies. |
|   **Proportion of Asymptomatic Infections**    |                              The percentage of infected individuals who do not show symptoms but can still transmit the pathogen. This affects the overall transmission dynamics and may make it harder to control the epidemic.                               |
|         **Severity by Age (IHR/IFR)**          |         Infection Hospitalisation Rate (IHR) and Infection Fatality Rate (IFR) describe the likelihood of an individual requiring hospital care or dying from the infection, often varying by age group and other individual risk factors.          |

---

### **Guide on how to use the modelling interface**

This interface is built using a combination of R packages developed by the Research Software for [Infectious Disease Epidemiology group at Imperial College London - RESIDE_IC](https://reside-ic.github.io/). The underlying tool, `wodin`, allows users to conduct exploratory analysis of compartmental models. Please use the link below to access more information on how to navigate the tool. 

<button onclick="window.location.href='https://mrc-ide.github.io/infectiousdiseasemodels-2022/guide/';" style = "background: aliceblue; border-radius: 5px; border-color: azure">
Introduction to using the `wodin` interface
</button>

<hr style="border:2px solid gray">

<div style="float: left; margin-right: 10px;">
<img src="files/index/reside_logo.png" style="height:50px; display:block;">
</div>

<div style="float: right; margin-left: 10px;">
<img src="files/index/mrc_logo.png" style="height:50px; display:block;">
</div>

<div style="clear: both;"></div>