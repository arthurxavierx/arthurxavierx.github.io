M4_DEFINE([NAV_LINK], [<a M4_IF(__FILE__, $2, [class="active" ])href="$2">$1</a>])dnl
<header>
  <h1>Arthur Xavier</h1>
  <nav>
    <ul class="line">
      <li>NAV_LINK(__([bio], [bio]), [bio.html])</li>
      <li>NAV_LINK(__([música], [music]), [music.html])</li>
      <li>NAV_LINK(__([texto], [text]), [text.html])</li>
      <li>NAV_LINK(__([etc], [etc]), [etc.html])</li>
      __(
        [<li class="break"><a href="en/__FILE__">english</a></li>],
        [<li class="break"><a href="../__FILE__">português</a></li>]
      )
    </ul>
  </nav>
</header>
