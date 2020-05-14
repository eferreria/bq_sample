view: sample {
  derived_table: {
    sql: select 1  ;;
  }
measure: count {
  type: count
  html:
  <div class="container" width="90%">
  <form action="/explore/dev_thecompany/orders" method="get" target="_new" class="_new">

<br>
<select name="fields" multiple="Yes" size="3">
  <option value="orders.status, ">Order Status </option>
  <option id="op2" value="users.city, "> User City </option>
  <option value="users.state, "> User State</option>
  <option value="orders.default*">Default Set </option>
</select>
<br> Hidden Input: Orders Status
<br> <input type="hidden" name="f[users.state]">

Hidden Filter: Orders=Complete
      <input type="submit" value="Go" name="" style="height:2em; width:100px">
      <input type="reset" value="Reset" name="" style="height:2em; width:100px">
</form>
</div>
;;
}


dimension: sample_dim {
  type: string
  sql: 'Hello World' ;;
  html:
  <style>
  a {text-decoration: none;}
    a:hover {text-decoration: none; color:gold;}
  </style>
  <a href="javascript:alert('Helo');"
  style="color:blue;"

  > {{value}}  </a>
  ;;
}
}
