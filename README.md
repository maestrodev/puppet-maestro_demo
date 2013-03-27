puppet-maestro-demo
===================

Demos are processed in the following order:

1. SOURCE-TYPES
2. SOURCES
3. COMPOSITIONS

Layout
------

    manifests -+- demo -+- source_type -+- base.pp               # Core stuff
               |        |               |
               |        |               +- generic.pp            # A generic (name only) source-type
               |        |               |
               |        |               +- <whatever.pp>         # Custom source-type that is more than just a name
               |        |
               |        +- source ------+- base.pp               # Core stuff
               |        |               |
               |        |               +- generic.pp            # A generic (name only) source
               |        |               |
               |        |               +- <whatever.pp>         # Custom source that is more than just a name
               |        |
               |        +- composition -+- base.pp               # Core stuff
               |                        |
               |                        +- generic.pp            # A generic (name only) composition
               |                        |
               |                        +- <whatever.pp>         # Custom composition that is more than just a name
               |
               |
    templates -+- demo -+- source_type -+- <whatever.json.erb>   # The source_type template
               |        |
               |        +- source ------+- <whatever.json.erb>   # The source template
               |        |
               |        +- composition -+- <whatever.json.erb>   # The composition template
               |
               |
    files --- -+- demo -+- source_type -+- <whatever>            # Any support files required by custom source_type(s)
                        |
                        +- source ------+- <whatever>            # Any support files requires by custom source(s)
                        |
                        +- composition -+- <whatever>            # Any support files requires by custom composition(s)

Each demo can have its own puppet class, so individual demos have better control over their own dependencies.  Many demos may
not require their own puppet class, so a "generic" one has been made available.  It takes only a name parameter, and uses that
to locate the appropriate "${name}.json.erb" file in the respective template directory.

Disabling a demo
----------------

When calling the 'base.pp' for a source_type, source, or composition, a parameter "enabled" may be set to false.  This will
cause the demo to NOT be installed.  Alternatively, you could just comment out the line :)

Non-working demos
-----------------

A Number of demos may not work out of the box.  This is expected.  Some will require additional manual configuration (i.e.
login credentials, hostnames, etc), and others may only be present to show that a given feature is available, but is not
supported in the limited demonstration environment available.
Full demonstrations are available by using the contact link on http://www.maestrodev.com
