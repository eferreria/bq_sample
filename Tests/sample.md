# Sample

Put your documentation here! Your text is rendered with [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown).

Click the "Edit Source" button above to make changes.
[Link](/explore/dev_thecompany/orders)

---
title: Help Center
navigation:
  - section: Help Center
  - document: overview_doc
    label: Overview
  - document: data_sources_doc
    label: Data Sources
  - document: data_definitions_doc
    label: Data Definitions
  - document: faq_doc
    label: FAQ
  - document: release_notes_doc
    label: Release Notes
---



<form action="" method="get" target="_new" name="f1" id="f1_id">

<br>
<select name="fields" multiple="Yes" size="3" id="fieldlist">
  <option value="orders.status, ">Order Status </option>
  <option value="users.city, "> User City </option>
  <option value="users.state, "> User State</option>
</select>

<input type="checkbox" name="fields" value="orders.status, "> Order Status
<input type="checkbox" name="fields" value="users.city, "> User City


<br> Hidden Input: Orders Status
<br> <input type="text" name="f[users.state]">
<br> <input type="text" name="MyField">
<br>
      <input type="submit" value="Go" name="" style="height:2em; width:100px">
      <input type="reset" value="Reset" name="" style="height:2em; width:100px">
</form>


<hr>
<form action="/looks/2" target="_new" id="form2">
Fields
<select name="fields" multiple="No" size="1" id="fieldlist">
  <option value="orders.status, ">Order Status </option>
  <option value="users.city, "> User City </option>
  <option value="users.state, "> User State</option>

  <option value="orders.default*">Default Set </option>
</select>
<br><br>
Filters
  <br> User City<input type="text" name="f[users.city]">
  <br> User State<input type="text" name="f[users.state]">
  <br> User Country<input type="text" name="f[users.country]">
  <br> Filter Expression <input type="text" name="filter_expression">
  <br> User Created Date <input type="text" name="f[users.created_date]">
  <br> <input type="submit" value="Submit">


<br> <input type="date" name="Service Date">

<div class="input-group input-daterange">
    <input type="date" class="form-control" value="2012-04-05">
    <div class="input-group-addon">to</div>
    <input type="date" class="form-control" value="2012-04-19">
</div>


</form>




https://eaf-looker.local:9999/explore/dev_thecompany/orders?fields=users.city,users.state,orders.status,orders.count&f[users.state]=&f[users.city]=&f[users.country]=&filter_expression=%24%7Busers.state%7D+%3D+%22California%22+OR+matches_filter%28%24%7Busers.city%7D%2C+%60Chicago%2C+New+York%60%29%0A&sorts=users.city&limit=1000&column_limit=50&vis=%7B%22type%22%3A%22table%22%7D&filter_config=%7B%22users.state%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22users.city%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%2C%22users.country%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A2%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded
