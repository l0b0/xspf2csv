<stylesheet
    version="1.0"
    xmlns="http://www.w3.org/1999/XSL/Transform"
    xmlns:strings="http://exslt.org/strings"
    xmlns:xspf="http://xspf.org/ns/0/"
    >
    <output method="text" encoding="utf-8"/>

    <param name="line-separator" select="'&#xa;'"/> <!-- Newline -->
    <param name="field-separator" select="','"/> <!-- Comma -->
    <param name="quote" select="'&quot;'"/> <!-- Double quote -->
    <param name="escaped-quote" select="'&quot;&quot;'"/>

    <template match="/">
        <!-- In case you want headers
        <text>artist</text>
        <value-of select="$field-separator"/>
        <text>title</text>
        <value-of select="$line-separator"/>
        -->
        <apply-templates
            select="xspf:playlist/xspf:trackList/xspf:track"/>
    </template>

    <template match="xspf:track">
        <apply-templates select="xspf:creator"/>
        <value-of select="$field-separator"/>
        <apply-templates select="xspf:title"/>
        <value-of select="$line-separator"/>
    </template>

    <template match="*">
        <!-- Replace all special characters -->
        <value-of select="concat(
            $quote,
            normalize-space(
                strings:replace(
                    strings:replace(
                        .,
                        $quote,
                        $escaped-quote),
                    $line-separator,
                    ' ')),
            $quote)"/>
    </template>
</stylesheet>
