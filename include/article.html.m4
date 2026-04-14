<article id="[$1]">
  <header>
    <div>
      <h5>$2</h5>
      [M4_IFVAL([$3], HTML_H6([$3]))]
    </div>
    <aside>[$4]</aside>
  </header>
  <div class="align">[$5]</div>
  <footer class="align">
    <ul class="line compact">
[M4_PUSHDEF([HTML_LINK], [<li>]M4_DEFN([HTML_LINK])[</li>])dnl
      $6
M4_POPDEF([HTML_LINK])]dnl
    </ul>
  </footer>
</article>
