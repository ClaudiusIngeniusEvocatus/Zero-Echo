<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/atom:feed">
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title><xsl:value-of select="atom:title"/> — RSS Feed</title>
        <style>
          body { font-family: Helvetica, Arial, sans-serif; max-width: 720px; margin: 2em auto; padding: 0 1em; color: #333; line-height: 1.5; }
          h1 { font-family: "Playfair Display", Georgia, serif; font-size: 2em; margin: 0 0 0.2em; }
          .subtitle { color: #666; margin: 0 0 2em; }
          .intro { background: #f8f8f0; padding: 1em 1.5em; border-radius: 4px; margin-bottom: 2em; font-size: 0.95em; }
          .intro p { margin: 0.5em 0; }
          .intro code { background: #eee; padding: 1px 4px; border-radius: 2px; font-size: 0.9em; }
          h2 { font-family: "Playfair Display", Georgia, serif; font-size: 1.3em; margin: 2em 0 0.1em; }
          h2 a { color: #333; text-decoration: none; }
          h2 a:hover { text-decoration: underline; }
          .date { color: #999; font-size: 0.9em; margin-bottom: 0.5em; }
          .entry { border-bottom: 1px solid #eee; padding-bottom: 1.5em; margin-bottom: 1em; }
          .entry:last-child { border-bottom: none; }
          .summary { color: #555; }
          .empty { color: #888; font-style: italic; }
          footer { margin-top: 3em; color: #999; font-size: 0.85em; text-align: center; }
          footer a { color: #999; }
        </style>
      </head>
      <body>
        <h1><xsl:value-of select="atom:title"/></h1>
        <p class="subtitle"><xsl:value-of select="atom:subtitle"/></p>
        <div class="intro">
          <p><strong>This is an Atom feed.</strong> A machine-readable index of the latest posts on this site, designed for RSS reader apps (Feedly, Inoreader, NetNewsWire, and similar).</p>
          <p>To subscribe, copy this page's URL — <code><xsl:value-of select="atom:link[@rel='self']/@href"/></code> — and paste it into your reader.</p>
        </div>
        <h2 style="margin-top: 0;">Recent posts</h2>
        <xsl:choose>
          <xsl:when test="atom:entry">
            <xsl:for-each select="atom:entry">
              <div class="entry">
                <h2>
                  <a>
                    <xsl:attribute name="href"><xsl:value-of select="atom:link/@href"/></xsl:attribute>
                    <xsl:value-of select="atom:title"/>
                  </a>
                </h2>
                <p class="date"><xsl:value-of select="substring(atom:published, 1, 10)"/></p>
                <xsl:if test="atom:summary">
                  <p class="summary"><xsl:value-of select="atom:summary"/></p>
                </xsl:if>
              </div>
            </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
            <p class="empty">No posts yet. Subscribe and they'll appear here as they go up.</p>
          </xsl:otherwise>
        </xsl:choose>
        <footer>
          <p>
            <a>
              <xsl:attribute name="href"><xsl:value-of select="atom:link[@rel='alternate']/@href"/></xsl:attribute>
              Visit the main site
            </a>
          </p>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>