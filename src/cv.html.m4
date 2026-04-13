M4_DEFINE([__PAGE__], [__([currículo], [cv])])dnl
M4_DEFINE([HTML_H6], [<address>$1</address>])dnl
M4_DEFINE([HTML_LI_LINK], [<li>HTML_LINK($1, $2)</li>])dnl
HTML_BEGIN([<link href="]__([], [../])[css/resume.css" rel="stylesheet" type="text/css">])

<header>
  <h1>Arthur Xavier</h1>
  <nav style="font-size: 1.1rem">
    <ul class="line compact">
      __([
      <li>Belo Horizonte, MG</li>
      <li>Brasília, DF</li>
      ], [
      <li>Belo Horizonte . Brasília, Brazil</li>
      ])
    </ul>
    <ul class="line compact">
      <li><a target="_blank" href="https://arthurxavierx.github.io">arthurxavierx.github.io</a></li>
      <li><a href="mailto:arthur.xavierx@gmail.com">arthur.xavierx@gmail.com</a></li>
    </ul>
  </nav>
</header>

<p class="summary">
  __([
    Arthur Xavier é artista e compositor residente entre Belo Horizonte, MG e Brasília, DF.
    Ex-engenheiro de software e bacharel em Ciência da Computação, hoje é estudante do Bacharelado
    em Música/Composição na UFMG e interessa-se por tudo o que é arte interativa, arte sonora
    e música eletroacústica. Acredita na arte enquanto ferramenta de emancipação subjetiva e
    política, e em seu potencial de despertar atenção, reflexão e ação através de experiências
    sensíveis. Investiga principalmente as questões das relações subjetivas com o trabalho, a
    tecnologia, o tempo e a memória.
  ], [
    Arthur Xavier is an artist and composer based in Belo Horizonte and Brasília, Brazil. A former
    Software Engineer and bachelor in Computer Science, nowadays Arthur studies Composition at
    the Federal University of Minas Gerais, Brazil and has a major interest on interactive arts, sound
    art and electroacoustic music. They believe in art as a tool for subjective and political liberation,
    and on its power of mobilizing attention, reflection and action through sensible experiences.
    Arthur mainly investigates the questions of subjective relations with work, technology,
    time and memory.
  ])
</p>

<section>
  <div class="align">
    <h3>__([Habilidades], [Skills])</h3>
    <ul>
      __([
      <li>Composição e arranjo para música instrumental e eletroacústica</li>
      <li>Produção musical, sound design e live electronics</li>
      <li>Programação de áudio: Ableton Live, Max/MSP, MaxForLive</li>
      <li>Programação visual: OpenGL, shaders, TouchDesigner</li>
      <li>Python, Haskell, C/C++, JavaScript, TypeScript, e outras linguagens</li>
      ], [
      <li>Composition and arrangement of instrumental and electroacoustic music</li>
      <li>Music production, sound design and live electronics</li>
      <li>Audio programming: Ableton Live, Max/MSP, MaxForLive</li>
      <li>Visual programming: OpenGL, shaders, TouchDesigner</li>
      <li>Python, Haskell, C/C++, JavaScript, TypeScript, and other languages</li>
      ])
    </ul>
    <h4>__([Idiomas], [Languages])</h4>
    <p>
      __([
      Português, inglês, francês, alemão, espanhol, italiano
      ], [
      Portuguese, English, French, German, Spanish, Italian.
      ])
    </p>
  </div>
</section>

M4_INCLUDE(cv/education.html.m4)dnl
M4_INCLUDE(cv/additional.html.m4)dnl
M4_INCLUDE(cv/professional.html.m4)dnl

HTML_END()
