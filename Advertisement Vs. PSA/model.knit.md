---
title: "Model and Analysis"
author: "Henry Yang"
format: html
execute:
  echo: false
  message: false
  warning: false
---


::: {.cell}

:::


## Question
**Causal**: What is the average causal effect of getting an email, compared to seeing a social media post, on the probability that a customer purchases a product?

### Variables
**Units:** Each customer identified by their unique user id.

**Covariates:** Age, Gender, Income, AdSpend, WebsiteVisits, PagesPerVisit, TimeOnSite, SocialShares, PreviousPurchases.

**Treatment:** CampaignChannel.

**Outcome:** Conversion.


## Justice
**Counter-assumption to validity:** The campaign channel is not specific enough. The "Email" treatment might be the same as the "Referral" treatment if the referral was just done by email. So, the CampaignChannel might not have valid correspondence to the treatments we really want to measure in the Preceptor Table. Therefore, we need more information on each treatment within CampaignChannel to determine if they are distinct.

**Counter-assumption to stability:** The data is from an experiment that took place two years ago, 2024, and the effect of advertisements on users may have changed from 2024 to 2026. Although two years might not have much of an effect, changes may have occured in trends, in the economy which may determine if users can afford to purchase certain products, and in technology. So, the slope on the effect of watching an advertisement might have changed between 2024 and present day, which is what we want to predict.

**Counter-assumptions to representativeness:** The data might not represent the population. In this dataset, the conversion rates for all Campaign Channels are around 70% to 80%, which seems unrealistic. However, we're only trying to answer the causal effect, which is between treatments, so this shouldn't be a major concern if the experiment was done correctly. Another subtle thing to note is how the data is comprised of 60% females and 40% males, a slight disproportionate distribution that may or may not add a small bias. Furthermore, the population in the dataset might not represent the present day population we want to make estimates for. 

**Counter-assumptions to unconfoundedness:** We don't know if treatment assignment was random. This is important because if treatment assignment was not random, our final estimates would be biased. For example, if users who are more likely to purchase a product are more likely to be assigned to a specific treatment group, then our estimates of the causal effect would change drastically.

**Probability Family:** Bernoulli

**Link Function:** Logit link (logistic regression)


## Models

::: {.cell}

:::



::: {.cell}
::: {.cell-output-display}

```{=html}
<div id="kykebdoihj" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#kykebdoihj table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#kykebdoihj thead, #kykebdoihj tbody, #kykebdoihj tfoot, #kykebdoihj tr, #kykebdoihj td, #kykebdoihj th {
  border-style: none;
}

#kykebdoihj p {
  margin: 0;
  padding: 0;
}

#kykebdoihj .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#kykebdoihj .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#kykebdoihj .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#kykebdoihj .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#kykebdoihj .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#kykebdoihj .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#kykebdoihj .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#kykebdoihj .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#kykebdoihj .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#kykebdoihj .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#kykebdoihj .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#kykebdoihj .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#kykebdoihj .gt_spanner_row {
  border-bottom-style: hidden;
}

#kykebdoihj .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#kykebdoihj .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#kykebdoihj .gt_from_md > :first-child {
  margin-top: 0;
}

#kykebdoihj .gt_from_md > :last-child {
  margin-bottom: 0;
}

#kykebdoihj .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#kykebdoihj .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#kykebdoihj .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#kykebdoihj .gt_row_group_first td {
  border-top-width: 2px;
}

#kykebdoihj .gt_row_group_first th {
  border-top-width: 2px;
}

#kykebdoihj .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#kykebdoihj .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#kykebdoihj .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#kykebdoihj .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#kykebdoihj .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#kykebdoihj .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#kykebdoihj .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#kykebdoihj .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#kykebdoihj .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#kykebdoihj .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#kykebdoihj .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#kykebdoihj .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#kykebdoihj .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#kykebdoihj .gt_left {
  text-align: left;
}

#kykebdoihj .gt_center {
  text-align: center;
}

#kykebdoihj .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#kykebdoihj .gt_font_normal {
  font-weight: normal;
}

#kykebdoihj .gt_font_bold {
  font-weight: bold;
}

#kykebdoihj .gt_font_italic {
  font-style: italic;
}

#kykebdoihj .gt_super {
  font-size: 65%;
}

#kykebdoihj .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#kykebdoihj .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#kykebdoihj .gt_indent_1 {
  text-indent: 5px;
}

#kykebdoihj .gt_indent_2 {
  text-indent: 10px;
}

#kykebdoihj .gt_indent_3 {
  text-indent: 15px;
}

#kykebdoihj .gt_indent_4 {
  text-indent: 20px;
}

#kykebdoihj .gt_indent_5 {
  text-indent: 25px;
}

#kykebdoihj .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}

#kykebdoihj div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="7" class="gt_heading gt_title gt_font_normal" style>Logistic Regression Model: Conversion by Campaign Channel</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="7" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Estimating the effect of different campaign channels on user conversion rates</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="term">term</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="estimate">estimate</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="std.error">std.error</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="statistic">statistic</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="p.value">p.value</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="conf.low">conf.low</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="conf.high">conf.high</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="term" class="gt_row gt_left">(Intercept)</td>
<td headers="estimate" class="gt_row gt_right">1.90328904</td>
<td headers="std.error" class="gt_row gt_right">0.07542202</td>
<td headers="statistic" class="gt_row gt_right">25.2351905</td>
<td headers="p.value" class="gt_row gt_right">1.646906e-140</td>
<td headers="conf.low" class="gt_row gt_right">1.75808699</td>
<td headers="conf.high" class="gt_row gt_right">2.0538959</td></tr>
    <tr><td headers="term" class="gt_row gt_left">CampaignChannelPPC</td>
<td headers="estimate" class="gt_row gt_right">0.11572922</td>
<td headers="std.error" class="gt_row gt_right">0.10736596</td>
<td headers="statistic" class="gt_row gt_right">1.0778948</td>
<td headers="p.value" class="gt_row gt_right">2.810807e-01</td>
<td headers="conf.low" class="gt_row gt_right">-0.09471835</td>
<td headers="conf.high" class="gt_row gt_right">0.3264151</td></tr>
    <tr><td headers="term" class="gt_row gt_left">CampaignChannelReferral</td>
<td headers="estimate" class="gt_row gt_right">0.11855501</td>
<td headers="std.error" class="gt_row gt_right">0.10640599</td>
<td headers="statistic" class="gt_row gt_right">1.1141762</td>
<td headers="p.value" class="gt_row gt_right">2.652036e-01</td>
<td headers="conf.low" class="gt_row gt_right">-0.09010655</td>
<td headers="conf.high" class="gt_row gt_right">0.3272568</td></tr>
    <tr><td headers="term" class="gt_row gt_left">CampaignChannelSEO</td>
<td headers="estimate" class="gt_row gt_right">0.05894195</td>
<td headers="std.error" class="gt_row gt_right">0.10798082</td>
<td headers="statistic" class="gt_row gt_right">0.5458557</td>
<td headers="p.value" class="gt_row gt_right">5.851651e-01</td>
<td headers="conf.low" class="gt_row gt_right">-0.15267004</td>
<td headers="conf.high" class="gt_row gt_right">0.2708742</td></tr>
    <tr><td headers="term" class="gt_row gt_left">CampaignChannelSocial Media</td>
<td headers="estimate" class="gt_row gt_right">-0.01697725</td>
<td headers="std.error" class="gt_row gt_right">0.10698886</td>
<td headers="statistic" class="gt_row gt_right">-0.1586824</td>
<td headers="p.value" class="gt_row gt_right">8.739191e-01</td>
<td headers="conf.low" class="gt_row gt_right">-0.22677324</td>
<td headers="conf.high" class="gt_row gt_right">0.1928706</td></tr>
  </tbody>
  <tfoot>
    <tr class="gt_sourcenotes">
      <td class="gt_sourcenote" colspan="7">Source: Digital Marketing Campaign Dataset</td>
    </tr>
  </tfoot>
</table>
</div>
```

:::
:::


### Interpretation
Social Media resulted in an average decrease in the probability of purchasing a product. The log-odds of a customer purchasing the product is -0.0170 lower for a customer who used Social Media (compared to Email), with a confidence interval of -0.227 to 0.193. This confidence interval passes zero, meaning that the effect of Social Media on the probability of purchasing a product compared to Emailis not statistically significant. The estimate is so small that it's basically zero.



::: {.cell}
::: {.cell-output-display}

```{=html}
<div id="cewfishbwa" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#cewfishbwa table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#cewfishbwa thead, #cewfishbwa tbody, #cewfishbwa tfoot, #cewfishbwa tr, #cewfishbwa td, #cewfishbwa th {
  border-style: none;
}

#cewfishbwa p {
  margin: 0;
  padding: 0;
}

#cewfishbwa .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#cewfishbwa .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#cewfishbwa .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#cewfishbwa .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#cewfishbwa .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#cewfishbwa .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cewfishbwa .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#cewfishbwa .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#cewfishbwa .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#cewfishbwa .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#cewfishbwa .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#cewfishbwa .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#cewfishbwa .gt_spanner_row {
  border-bottom-style: hidden;
}

#cewfishbwa .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#cewfishbwa .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#cewfishbwa .gt_from_md > :first-child {
  margin-top: 0;
}

#cewfishbwa .gt_from_md > :last-child {
  margin-bottom: 0;
}

#cewfishbwa .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#cewfishbwa .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#cewfishbwa .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#cewfishbwa .gt_row_group_first td {
  border-top-width: 2px;
}

#cewfishbwa .gt_row_group_first th {
  border-top-width: 2px;
}

#cewfishbwa .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#cewfishbwa .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#cewfishbwa .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#cewfishbwa .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cewfishbwa .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#cewfishbwa .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#cewfishbwa .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#cewfishbwa .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#cewfishbwa .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cewfishbwa .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#cewfishbwa .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#cewfishbwa .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#cewfishbwa .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#cewfishbwa .gt_left {
  text-align: left;
}

#cewfishbwa .gt_center {
  text-align: center;
}

#cewfishbwa .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#cewfishbwa .gt_font_normal {
  font-weight: normal;
}

#cewfishbwa .gt_font_bold {
  font-weight: bold;
}

#cewfishbwa .gt_font_italic {
  font-style: italic;
}

#cewfishbwa .gt_super {
  font-size: 65%;
}

#cewfishbwa .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#cewfishbwa .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#cewfishbwa .gt_indent_1 {
  text-indent: 5px;
}

#cewfishbwa .gt_indent_2 {
  text-indent: 10px;
}

#cewfishbwa .gt_indent_3 {
  text-indent: 15px;
}

#cewfishbwa .gt_indent_4 {
  text-indent: 20px;
}

#cewfishbwa .gt_indent_5 {
  text-indent: 25px;
}

#cewfishbwa .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}

#cewfishbwa div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="7" class="gt_heading gt_title gt_font_normal" style>Logistic Regression Model: Conversion with Campaign Channel and other Covariates</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="7" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Adjusting for other covariates</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="term">term</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="estimate">estimate</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="std.error">std.error</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="statistic">statistic</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="p.value">p.value</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="conf.low">conf.low</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="conf.high">conf.high</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="term" class="gt_row gt_left">(Intercept)</td>
<td headers="estimate" class="gt_row gt_right">-1.251766743</td>
<td headers="std.error" class="gt_row gt_right">0.215026049</td>
<td headers="statistic" class="gt_row gt_right">-5.8214656</td>
<td headers="p.value" class="gt_row gt_right">5.833382e-09</td>
<td headers="conf.low" class="gt_row gt_right">-1.673523949</td>
<td headers="conf.high" class="gt_row gt_right">-0.830453708</td></tr>
    <tr><td headers="term" class="gt_row gt_left">CampaignChannelPPC</td>
<td headers="estimate" class="gt_row gt_right">0.143038543</td>
<td headers="std.error" class="gt_row gt_right">0.111479683</td>
<td headers="statistic" class="gt_row gt_right">1.2830907</td>
<td headers="p.value" class="gt_row gt_right">1.994603e-01</td>
<td headers="conf.low" class="gt_row gt_right">-0.075453056</td>
<td headers="conf.high" class="gt_row gt_right">0.361787849</td></tr>
    <tr><td headers="term" class="gt_row gt_left">CampaignChannelReferral</td>
<td headers="estimate" class="gt_row gt_right">0.151351105</td>
<td headers="std.error" class="gt_row gt_right">0.110444686</td>
<td headers="statistic" class="gt_row gt_right">1.3703793</td>
<td headers="p.value" class="gt_row gt_right">1.705685e-01</td>
<td headers="conf.low" class="gt_row gt_right">-0.065191257</td>
<td headers="conf.high" class="gt_row gt_right">0.367986435</td></tr>
    <tr><td headers="term" class="gt_row gt_left">CampaignChannelSEO</td>
<td headers="estimate" class="gt_row gt_right">0.091471318</td>
<td headers="std.error" class="gt_row gt_right">0.112139921</td>
<td headers="statistic" class="gt_row gt_right">0.8156892</td>
<td headers="p.value" class="gt_row gt_right">4.146779e-01</td>
<td headers="conf.low" class="gt_row gt_right">-0.128270027</td>
<td headers="conf.high" class="gt_row gt_right">0.311560755</td></tr>
    <tr><td headers="term" class="gt_row gt_left">CampaignChannelSocial Media</td>
<td headers="estimate" class="gt_row gt_right">-0.001645491</td>
<td headers="std.error" class="gt_row gt_right">0.111433323</td>
<td headers="statistic" class="gt_row gt_right">-0.0147666</td>
<td headers="p.value" class="gt_row gt_right">9.882184e-01</td>
<td headers="conf.low" class="gt_row gt_right">-0.220125182</td>
<td headers="conf.high" class="gt_row gt_right">0.216925604</td></tr>
    <tr><td headers="term" class="gt_row gt_left">Age</td>
<td headers="estimate" class="gt_row gt_right">0.001329212</td>
<td headers="std.error" class="gt_row gt_right">0.002368820</td>
<td headers="statistic" class="gt_row gt_right">0.5611282</td>
<td headers="p.value" class="gt_row gt_right">5.747102e-01</td>
<td headers="conf.low" class="gt_row gt_right">-0.003314038</td>
<td headers="conf.high" class="gt_row gt_right">0.005973525</td></tr>
    <tr><td headers="term" class="gt_row gt_left">GenderMale</td>
<td headers="estimate" class="gt_row gt_right">0.013391558</td>
<td headers="std.error" class="gt_row gt_right">0.072238754</td>
<td headers="statistic" class="gt_row gt_right">0.1853791</td>
<td headers="p.value" class="gt_row gt_right">8.529317e-01</td>
<td headers="conf.low" class="gt_row gt_right">-0.127764600</td>
<td headers="conf.high" class="gt_row gt_right">0.155480771</td></tr>
    <tr><td headers="term" class="gt_row gt_left">Income</td>
<td headers="estimate" class="gt_row gt_right">0.010848976</td>
<td headers="std.error" class="gt_row gt_right">0.009424448</td>
<td headers="statistic" class="gt_row gt_right">1.1511524</td>
<td headers="p.value" class="gt_row gt_right">2.496695e-01</td>
<td headers="conf.low" class="gt_row gt_right">-0.007618696</td>
<td headers="conf.high" class="gt_row gt_right">0.029332326</td></tr>
    <tr><td headers="term" class="gt_row gt_left">AdSpend</td>
<td headers="estimate" class="gt_row gt_right">0.014583084</td>
<td headers="std.error" class="gt_row gt_right">0.001291497</td>
<td headers="statistic" class="gt_row gt_right">11.2916131</td>
<td headers="p.value" class="gt_row gt_right">1.443626e-29</td>
<td headers="conf.low" class="gt_row gt_right">0.012063960</td>
<td headers="conf.high" class="gt_row gt_right">0.017127657</td></tr>
    <tr><td headers="term" class="gt_row gt_left">WebsiteVisits</td>
<td headers="estimate" class="gt_row gt_right">0.018500774</td>
<td headers="std.error" class="gt_row gt_right">0.002484879</td>
<td headers="statistic" class="gt_row gt_right">7.4453406</td>
<td headers="p.value" class="gt_row gt_right">9.669459e-14</td>
<td headers="conf.low" class="gt_row gt_right">0.013644092</td>
<td headers="conf.high" class="gt_row gt_right">0.023386722</td></tr>
    <tr><td headers="term" class="gt_row gt_left">PagesPerVisit</td>
<td headers="estimate" class="gt_row gt_right">0.131286056</td>
<td headers="std.error" class="gt_row gt_right">0.013834013</td>
<td headers="statistic" class="gt_row gt_right">9.4900922</td>
<td headers="p.value" class="gt_row gt_right">2.308300e-21</td>
<td headers="conf.low" class="gt_row gt_right">0.104273643</td>
<td headers="conf.high" class="gt_row gt_right">0.158513859</td></tr>
    <tr><td headers="term" class="gt_row gt_left">TimeOnSite</td>
<td headers="estimate" class="gt_row gt_right">0.100293633</td>
<td headers="std.error" class="gt_row gt_right">0.008605248</td>
<td headers="statistic" class="gt_row gt_right">11.6549386</td>
<td headers="p.value" class="gt_row gt_right">2.165363e-31</td>
<td headers="conf.low" class="gt_row gt_right">0.083508968</td>
<td headers="conf.high" class="gt_row gt_right">0.117248310</td></tr>
    <tr><td headers="term" class="gt_row gt_left">SocialShares</td>
<td headers="estimate" class="gt_row gt_right">-0.001014298</td>
<td headers="std.error" class="gt_row gt_right">0.001224839</td>
<td headers="statistic" class="gt_row gt_right">-0.8281070</td>
<td headers="p.value" class="gt_row gt_right">4.076099e-01</td>
<td headers="conf.low" class="gt_row gt_right">-0.003416563</td>
<td headers="conf.high" class="gt_row gt_right">0.001385744</td></tr>
    <tr><td headers="term" class="gt_row gt_left">PreviousPurchases</td>
<td headers="estimate" class="gt_row gt_right">0.128219556</td>
<td headers="std.error" class="gt_row gt_right">0.012521854</td>
<td headers="statistic" class="gt_row gt_right">10.2396620</td>
<td headers="p.value" class="gt_row gt_right">1.316957e-24</td>
<td headers="conf.low" class="gt_row gt_right">0.103780658</td>
<td headers="conf.high" class="gt_row gt_right">0.152876168</td></tr>
  </tbody>
  <tfoot>
    <tr class="gt_sourcenotes">
      <td class="gt_sourcenote" colspan="7">Source: Digital Marketing Campaign Dataset</td>
    </tr>
  </tfoot>
</table>
</div>
```

:::
:::


### Interpretation
**Main:** Adjusting for the covariates, the coefficient for Social Media campaigns is -0.0017, with a confidence interval of -0.220 to 0.217. The estimate decreased by a factor of ten compared to the previous model. This means that Social Media and Email have relatively the same effect on conversion rates. Besides that, this model also tells us the coefficients for all the other variables:

* **Age:** For every one additional year of age, the log-odds of purchasing the product increases by 0.00133, with a confidence interval of -0.00331 to 0.00597. This interval includes zero, meaning it is not statistically significant. So, age does not have a clear effect on the probability of purchasing the product.

* **Gender:** For male users compared to female users, the log-odds of purchasing the product increases by 0.0134, with a confidence interval of -0.128 to 0.155. This interval includes zero, meaning it is not statistically significant. So, gender does not have a clear effect on the probability of purchasing the product.

* **Income:** For every additional $10,000 of income, the log-odds of purchasing the product increases by 0.0108, with a confidence interval of -0.00762 to 0.0293. This interval includes zero, meaning it is not statistically significant. So, income does not have a clear effect on the probability of purchasing the product.

* **AdSpend:** For every additional $100 spent on advertising, the log-odds of purchasing the product increases by 0.0146, with a confidence interval of 0.0121 to 0.0171. This interval doesn't pass zero, meaning it's statistically significant. So, higher ad spend increases the probability of purchasing the product.

* **WebsiteVisits:** For every one additional website visit, the log-odds of purchasing the product increases by 0.0185, with a confidence interval of 0.0136 to 0.0234. This interval doesn't pass zero, meaning it's statistically significant. So, visiting the website more often increases the probability of purchasing the product.

* **PagesPerVisit:** For every one additional page viewed per visit, the log-odds of purchasing the product increases by 0.131, with a confidence interval of 0.104 to 0.159. This interval doesn't pass zero, meaning it's statistically significant. So, viewing more pages per visit increases the probability of purchasing the product.

* **TimeOnSite:** For every one additional minute of time spent on the site, the log-odds of purchasing the product increases by 0.100, with a confidence interval of 0.0835 to 0.117. This interval doesn't pass zero, meaning it's statistically significant. So, spending more time on site increases the probability of purchasing the product.

* **SocialShares:** For every one additional social share, the log-odds of purchasing the product decreases by 0.00101, with a confidence interval of -0.00342 to 0.00139. This interval includes zero, meaning it is not statistically significant. So, social sharing does not have a clear effect on the probability of purchasing the product.

* **PreviousPurchases:** For every one additional previous purchase, the log-odds of purchasing the product increases by 0.128, with a confidence interval of 0.104 to 0.153. This interval doesn't pass zero, meaning it's statistically significant. So, having more previous purchases increases the probability of purchasing the product.


## Data Generating Mechanism Formula

::: {.cell}

:::


$$\begin{aligned}
\widehat{\text{logit}(P(\text{Conversion} = 1))} &= -1.25 + 0.143 \cdot \text{CampaignChannel}_{\text{PPC}} + 0.151 \cdot \text{CampaignChannel}_{\text{Referral}} \\
&\quad + 0.0915 \cdot \text{CampaignChannel}_{\text{SEO}} - 0.00165 \cdot \text{CampaignChannel}_{\text{Social Media}} \\
&\quad + 0.00133 \cdot \text{Age} + 0.0134 \cdot \text{Gender}_{\text{Male}} + 0.0108 \cdot \text{Income}_{10k} \\
&\quad + 0.0146 \cdot \text{AdSpend}_{100} + 0.0185 \cdot \text{WebsiteVisits} + 0.131 \cdot \text{PagesPerVisit} \\
&\quad + 0.100 \cdot \text{TimeOnSite} - 0.00101 \cdot \text{SocialShares} + 0.128 \cdot \text{PreviousPurchases}
\end{aligned}$$


## Temperance

::: {.cell}
::: {.cell-output-display}

```{=html}
<div id="poffffptrq" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#poffffptrq table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#poffffptrq thead, #poffffptrq tbody, #poffffptrq tfoot, #poffffptrq tr, #poffffptrq td, #poffffptrq th {
  border-style: none;
}

#poffffptrq p {
  margin: 0;
  padding: 0;
}

#poffffptrq .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#poffffptrq .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#poffffptrq .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#poffffptrq .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#poffffptrq .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#poffffptrq .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#poffffptrq .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#poffffptrq .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#poffffptrq .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#poffffptrq .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#poffffptrq .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#poffffptrq .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#poffffptrq .gt_spanner_row {
  border-bottom-style: hidden;
}

#poffffptrq .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#poffffptrq .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#poffffptrq .gt_from_md > :first-child {
  margin-top: 0;
}

#poffffptrq .gt_from_md > :last-child {
  margin-bottom: 0;
}

#poffffptrq .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#poffffptrq .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#poffffptrq .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#poffffptrq .gt_row_group_first td {
  border-top-width: 2px;
}

#poffffptrq .gt_row_group_first th {
  border-top-width: 2px;
}

#poffffptrq .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#poffffptrq .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#poffffptrq .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#poffffptrq .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#poffffptrq .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#poffffptrq .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#poffffptrq .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#poffffptrq .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#poffffptrq .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#poffffptrq .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#poffffptrq .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#poffffptrq .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#poffffptrq .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#poffffptrq .gt_left {
  text-align: left;
}

#poffffptrq .gt_center {
  text-align: center;
}

#poffffptrq .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#poffffptrq .gt_font_normal {
  font-weight: normal;
}

#poffffptrq .gt_font_bold {
  font-weight: bold;
}

#poffffptrq .gt_font_italic {
  font-style: italic;
}

#poffffptrq .gt_super {
  font-size: 65%;
}

#poffffptrq .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#poffffptrq .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#poffffptrq .gt_indent_1 {
  text-indent: 5px;
}

#poffffptrq .gt_indent_2 {
  text-indent: 10px;
}

#poffffptrq .gt_indent_3 {
  text-indent: 15px;
}

#poffffptrq .gt_indent_4 {
  text-indent: 20px;
}

#poffffptrq .gt_indent_5 {
  text-indent: 25px;
}

#poffffptrq .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}

#poffffptrq div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="6" class="gt_heading gt_title gt_font_normal" style>Average Comparisons (Marginal Effects)</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Estimating average causal effects of campaign channels and covariates</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="term">term</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="contrast">contrast</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="estimate">estimate</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="std.error">std.error</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="conf.low">conf.low</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="conf.high">conf.high</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="term" class="gt_row gt_left">AdSpend</td>
<td headers="contrast" class="gt_row gt_left">+1</td>
<td headers="estimate" class="gt_row gt_right">0.0014580487</td>
<td headers="std.error" class="gt_row gt_right">0.0001282135</td>
<td headers="conf.low" class="gt_row gt_right">0.0012067548</td>
<td headers="conf.high" class="gt_row gt_right">0.0017093426</td></tr>
    <tr><td headers="term" class="gt_row gt_left">Age</td>
<td headers="contrast" class="gt_row gt_left">+1</td>
<td headers="estimate" class="gt_row gt_right">0.0001334774</td>
<td headers="std.error" class="gt_row gt_right">0.0002377725</td>
<td headers="conf.low" class="gt_row gt_right">-0.0003325480</td>
<td headers="conf.high" class="gt_row gt_right">0.0005995029</td></tr>
    <tr><td headers="term" class="gt_row gt_left">CampaignChannel</td>
<td headers="contrast" class="gt_row gt_left">PPC - Email</td>
<td headers="estimate" class="gt_row gt_right">0.0144452149</td>
<td headers="std.error" class="gt_row gt_right">0.0112683300</td>
<td headers="conf.low" class="gt_row gt_right">-0.0076403061</td>
<td headers="conf.high" class="gt_row gt_right">0.0365307360</td></tr>
    <tr><td headers="term" class="gt_row gt_left">CampaignChannel</td>
<td headers="contrast" class="gt_row gt_left">Referral - Email</td>
<td headers="estimate" class="gt_row gt_right">0.0152434222</td>
<td headers="std.error" class="gt_row gt_right">0.0111438456</td>
<td headers="conf.low" class="gt_row gt_right">-0.0065981139</td>
<td headers="conf.high" class="gt_row gt_right">0.0370849583</td></tr>
    <tr><td headers="term" class="gt_row gt_left">CampaignChannel</td>
<td headers="contrast" class="gt_row gt_left">SEO - Email</td>
<td headers="estimate" class="gt_row gt_right">0.0093932444</td>
<td headers="std.error" class="gt_row gt_right">0.0115136478</td>
<td headers="conf.low" class="gt_row gt_right">-0.0131730906</td>
<td headers="conf.high" class="gt_row gt_right">0.0319595794</td></tr>
    <tr><td headers="term" class="gt_row gt_left">CampaignChannel</td>
<td headers="contrast" class="gt_row gt_left">Social Media - Email</td>
<td headers="estimate" class="gt_row gt_right">-0.0001741102</td>
<td headers="std.error" class="gt_row gt_right">0.0117908913</td>
<td headers="conf.low" class="gt_row gt_right">-0.0232838324</td>
<td headers="conf.high" class="gt_row gt_right">0.0229356120</td></tr>
    <tr><td headers="term" class="gt_row gt_left">Gender</td>
<td headers="contrast" class="gt_row gt_left">Male - Female</td>
<td headers="estimate" class="gt_row gt_right">0.0013441259</td>
<td headers="std.error" class="gt_row gt_right">0.0072440480</td>
<td headers="conf.low" class="gt_row gt_right">-0.0128539472</td>
<td headers="conf.high" class="gt_row gt_right">0.0155421990</td></tr>
    <tr><td headers="term" class="gt_row gt_left">Income</td>
<td headers="contrast" class="gt_row gt_left">+1</td>
<td headers="estimate" class="gt_row gt_right">0.0010860366</td>
<td headers="std.error" class="gt_row gt_right">0.0009400011</td>
<td headers="conf.low" class="gt_row gt_right">-0.0007563317</td>
<td headers="conf.high" class="gt_row gt_right">0.0029284049</td></tr>
    <tr><td headers="term" class="gt_row gt_left">PagesPerVisit</td>
<td headers="contrast" class="gt_row gt_left">+1</td>
<td headers="estimate" class="gt_row gt_right">0.0126291325</td>
<td headers="std.error" class="gt_row gt_right">0.0012748417</td>
<td headers="conf.low" class="gt_row gt_right">0.0101304886</td>
<td headers="conf.high" class="gt_row gt_right">0.0151277763</td></tr>
    <tr><td headers="term" class="gt_row gt_left">PreviousPurchases</td>
<td headers="contrast" class="gt_row gt_left">+1</td>
<td headers="estimate" class="gt_row gt_right">0.0123467390</td>
<td headers="std.error" class="gt_row gt_right">0.0011562859</td>
<td headers="conf.low" class="gt_row gt_right">0.0100804603</td>
<td headers="conf.high" class="gt_row gt_right">0.0146130178</td></tr>
    <tr><td headers="term" class="gt_row gt_left">SocialShares</td>
<td headers="contrast" class="gt_row gt_left">+1</td>
<td headers="estimate" class="gt_row gt_right">-0.0001019327</td>
<td headers="std.error" class="gt_row gt_right">0.0001231303</td>
<td headers="conf.low" class="gt_row gt_right">-0.0003432637</td>
<td headers="conf.high" class="gt_row gt_right">0.0001393983</td></tr>
    <tr><td headers="term" class="gt_row gt_left">TimeOnSite</td>
<td headers="contrast" class="gt_row gt_left">+1</td>
<td headers="estimate" class="gt_row gt_right">0.0097476637</td>
<td headers="std.error" class="gt_row gt_right">0.0008092601</td>
<td headers="conf.low" class="gt_row gt_right">0.0081615431</td>
<td headers="conf.high" class="gt_row gt_right">0.0113337843</td></tr>
    <tr><td headers="term" class="gt_row gt_left">WebsiteVisits</td>
<td headers="contrast" class="gt_row gt_left">+1</td>
<td headers="estimate" class="gt_row gt_right">0.0018473662</td>
<td headers="std.error" class="gt_row gt_right">0.0002462965</td>
<td headers="conf.low" class="gt_row gt_right">0.0013646340</td>
<td headers="conf.high" class="gt_row gt_right">0.0023300984</td></tr>
  </tbody>
  <tfoot>
    <tr class="gt_sourcenotes">
      <td class="gt_sourcenote" colspan="6">Source: Digital Marketing Campaign Dataset</td>
    </tr>
  </tfoot>
</table>
</div>
```

:::
:::


### Interpretation - Answering the initial question
Adjusting for all the covariates, *the **average causal effect** of Social Media as a means of campaigning, compared to receiving an Email as a means of campaigning, on the probability that a customer purchases a product is **-0.000174***, with a confidence interval between -0.023284 to 0.022936. In other words, compared to Emails, receiving a Social Media treatment resulted in a **0.0174 percentage point** increase in the probability that you'll buy a product (confidence interval: -2.3284 to 2.2936 percentage points). However, not only is this an extremely small probability difference, but also the confidence intervals pass zero. Therefore, there isn't really a causal change between Social Media and Email.

## Graphs
**Key note:** Realistic conversion rates are likely much lower in percent, but should share the same slope. (Distribution shift)

::: {.cell}
::: {.cell-output-display}
![](model_files/figure-html/unnamed-chunk-7-1.png){width=672}
:::
:::



::: {.cell}
::: {.cell-output-display}
![](model_files/figure-html/unnamed-chunk-8-1.png){width=672}
:::
:::



::: {.cell}
::: {.cell-output-display}
![](model_files/figure-html/unnamed-chunk-9-1.png){width=672}
:::
:::



::: {.cell}
::: {.cell-output-display}
![](model_files/figure-html/unnamed-chunk-10-1.png){width=672}
:::
:::



::: {.cell}
::: {.cell-output-display}
![](model_files/figure-html/unnamed-chunk-11-1.png){width=672}
:::
:::





