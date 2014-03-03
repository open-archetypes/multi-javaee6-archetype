This archetype will generates a *very basic* multi module Java EE 6 project composed of a parent pom project and 4 nested modules : 

      __artifactId__    : parent pom project
      +---__rootArtifactId__-ear : EAR 6.0 module 
      +---__rootArtifactId__-ejb : EJB 3.1 module
      +---__rootArtifactId__-util: Java Utility module
      +---__rootArtifactId__-web : Web 3.0 module

The application itself is an over architectured hello world app yet no JSF nor persistence are involved. 
The original purpose of this archetype was to test m2e-wtp and some Eclipse server adapters behavior. But it's actually not tied to eclipse in any way so you can use it with any Java IDE.

Pre-Requisites :
-------------------

* JDK 1.7 or later
* maven 3.0 or later

How to use in Eclipse
---------------------

In Eclipse, first add the Open Archetypes catalog :

* On the Archetypes Preferences page (Window > Preferences > Maven > Archetypes), click on the "Add Remote Catalog..." button

    - Catalog file : http://open-archetypes.github.com/maven-repo/releases/
    - Description : Open Archetypes

* Click OK to close the dialog
* Click OK to close the preferences

Now you can create a new project, using the Maven wizard :    

* Create a new Maven project
* Click Next to land on the Archetype page
* Select the `Open Archetypes` catalog
* Select `multi-javaee6-archetype` and click Next
* You can change the required properties if needed :

    - enable_openshift : adds an openshift profile to the EAR project, so you can deploy ot to [Red Hat's OpenShift PAAS](https://openshift.redhat.com)
    Supported values are : `yes`, `no`, `true`, `false`. Defaults to `yes` .
* Hit Finish
* Wait for awesomeness
* Once the projects are created, you can deploy the EAR project to an application server supporting the Full Java EE 6 profile (provided you installed the proper server adapters).

The generated project has been tested to work with JBoss AS 7.1, WildFly 8.0, GlassFish 3.0 and 4.0. 


How to use in command line
--------------------------
Open a terminal and copy/paste

    mvn archetype:generate -Dfilter=multi-javaee6-archetype -DarchetypeCatalog=http://open-archetypes.github.com/maven-repo/releases/
  
Choose 1
Fill in the required properties and proceed.

Then cd into the generated project and you can build it like any other Maven project :
    mvn verify
    
You can then deploy the generated EAR file (<project>/<project>-ear/target/<project>-ear-<version>.ear) to an application server supporting the Full Java EE 6 profile. 


How to build the archetype
--------------------------
If you have Maven and Git installed, simply issue the following commands in a terminal to clone this GitHub repositpry and build the archetype with Maven :
    
    git clone git://github.com/open-archetypes/multi-javaee6-archetype.git
    cd multi-javaee6-archetype
    mvn install
