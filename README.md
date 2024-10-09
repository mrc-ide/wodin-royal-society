## Infectious disease models to support decisions on non-pharmaceutical interventions (NPIs) for future pathogens with pandemic potential

For more information, see [https://wodin-dev.dide.ic.ac.uk/royal-society/](https://wodin-dev.dide.ic.ac.uk/royal-society/). Note this site
is still in development and not to be used or relied on externally. 

Automated screenshots are generated in a github workflow named `screenshots` which runs a suite of Playwright tests. To
run these locally:
1. Run WODIN with config: `./scripts/run-wodin`
1. Make playwright suite the local folder: `cd screenshot`
1. Install Playwright: `npm install -D @playwright/test && npx playwright install`
1. Run the tests: `npx playwright test`
