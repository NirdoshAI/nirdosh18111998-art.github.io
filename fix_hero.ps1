$file = 'c:\Users\DELL\Desktop\My Portfolio Work\index.html'
$content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

# Find and replace the hero-inner content
# We'll find the opening of the hero section and close it, then rebuild it
$heroStart = $content.IndexOf('  <!-- HERO -->')
$heroEnd = $content.IndexOf('  <!-- ABOUT -->')

if ($heroStart -lt 0 -or $heroEnd -lt 0) {
  Write-Host "ERROR: Could not find hero markers"
  exit 1
}

$heroNew = @'
  <!-- HERO -->
  <section id="hero">
    <div class="hero-inner">

      <!-- LEFT: text content -->
      <div class="hero-content">
        <h1 class="hero-title">
          Nirdosh<br>
          <span class="line2">Kapoor.</span>
        </h1>
        <p class="hero-sub">
          I build things with vibes &mdash; AI-powered apps, slick dashboards, full-stack websites, and anything in between. If
          it can be coded, it can be vibed.
        </p>
        <div class="hero-btns">
          <a href="#projects" class="btn-primary">See My Work &rarr;</a>
          <a href="#contact" class="btn-outline">
            <svg width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
              <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z" />
            </svg>
            Get In Touch
          </a>
        </div>
        <div class="hero-stats">
          <div>
            <div class="stat-num">AI</div>
            <div class="stat-label">Apps &amp; Tools</div>
          </div>
          <div>
            <div class="stat-num">&infin;</div>
            <div class="stat-label">Ideas Shipped</div>
          </div>
          <div>
            <div class="stat-num">100%</div>
            <div class="stat-label">Vibe Coded</div>
          </div>
        </div>
      </div>

      <!-- RIGHT: animated terminal -->
      <div class="hero-terminal">
        <div class="terminal-window">
          <div class="terminal-header">
            <span class="term-dot term-dot-r"></span>
            <span class="term-dot term-dot-y"></span>
            <span class="term-dot term-dot-g"></span>
            <span class="terminal-title">nk@portfolio ~ %</span>
          </div>
          <div class="terminal-body" id="termBody">
            <!-- lines injected by JS -->
          </div>
        </div>
      </div>
    </div>
  </section>

'@

$before = $content.Substring(0, $heroStart)
$after = $content.Substring($heroEnd)
$newContent = $before + $heroNew + $after

[System.IO.File]::WriteAllText($file, $newContent, [System.Text.Encoding]::UTF8)
Write-Host "SUCCESS: Hero section updated"
