# Global variables
if (!exists('PROJECT_CONFIG_LOADED')) {
  if (file.exists("config.R")) {
    source("config.R")
  } else {
    stop("Error: missing config.R file")
  }
}

# Load necessary libraries
Packages <- c("data.table", "tidyverse")
pacman::p_load(char = Packages)

if (!dir.exists(DATA_PATH)) dir.create(DATA_PATH)
if (!dir.exists(SVI_DATA_PATH)) dir.create(SVI_DATA_PATH)
if (!dir.exists(SHAPES_PATH)) dir.create(SHAPES_PATH)
if (!dir.exists(SVI_DOCS_PATH)) dir.create(SVI_DOCS_PATH)

# CDC SVI CSV Data File for North Carolina Counties
if (!file.exists(SVI_RDATA_DST)) {
  svi_data <- fread(SVI_CSV_SRC, drop = c('ST', 'STATE','ST_ABBR','LOCATION')) %>% 
    rename('sum.themes' = 'SPL_THEMES',
           'sum.socioecon.theme' = 'SPL_THEME1',
           'sum.household.comp.theme' = 'SPL_THEME2',
           'sum.minority.lang.theme' = 'SPL_THEME3',
           'sum.home.transp.theme' = 'SPL_THEME4',
           'rank.themes' = 'RPL_THEMES',
           'rank.socioecon.theme' = 'RPL_THEME1',
           'rank.household.comp.theme' = 'RPL_THEME2',
           'rank.minority.lang.theme' = 'RPL_THEME3',
           'rank.home.transp.theme' = 'RPL_THEME4',
           'flags.theme1' = 'F_THEME1',
           'flags.theme2' = 'F_THEME2',
           'flags.theme3' = 'F_THEME3',
           'flags.theme4' = 'F_THEME4',
           'flags.total' = 'F_TOTAL',
           'est.uninsured' = 'E_UNINSUR',
           'moe_uninsured' = 'M_UNINSUR',
           'estpct.uninsured' = 'EP_UNINSUR',
           'moepct.uninsured' = 'MP_UNINSUR',
           'est.population' = 'E_TOTPOP',
           'est.daytime.pop' = 'E_DAYPOP',
           'moe.population' = 'M_TOTPOP',
           'est.housing.units' = 'E_HU',
           'moe.housing.units' = 'M_HU',
           'est.households' = 'E_HH',
           'moe.households' = 'M_HH',
           'est.person.below.poverty' = 'E_POV',
           'estpct.person.below.poverty' = 'EP_POV',
           'estrnk.person.below.poverty' = 'EPL_POV',
           'moe.person.below.poverty' = 'M_POV',
           'moepct.person.below.poverty' = 'MP_POV',
           'flag.poverty' = 'F_POV',
           'est.unempl.civilians' = 'E_UNEMP',
           'estpct.unempl.civilians' = 'EP_UNEMP',
           'estprnk.unempl.civilians' = 'EPL_UNEMP',
           'moe.unempl.civilians' = 'M_UNEMP',
           'moepct.unempl.civilians' = 'MP_UNEMP',
           'flag.unemployment' = 'F_UNEMP',
           'est.percapita.income' = 'E_PCI',
           'estpct.percapita.income' = 'EP_PCI',
           'estrnk.percapita.income' = 'EPL_PCI',
           'moe.percapita.income' = 'M_PCI',
           'moepct.percapita.income' = 'MP_PCI',
           'flag.percapita.income' = 'F_PCI',
           'est.no.highschool.diploma' = 'E_NOHSDP',
           'estpct.no.highschool.diploma' = 'EP_NOHSDP',
           'estrnk.no.highschool.diploma' = 'EPL_NOHSDP',
           'moe.no.highschool.diploma' = 'M_NOHSDP',
           'moepct.no.highschool.diploma' = 'MP_NOHSDP',
           'flag.no.highschool.diploma' = 'F_NOHSDP',
           'est.sixty.five.or.older' = 'E_AGE65',
           'estpct.sixty.five.or.older' = 'EP_AGE65',
           'estrnk.sixty.five.or.older' = 'EPL_AGE65',
           'moe.sixty.five.or.older' = 'M_AGE65',
           'moepct.sixty.five.or.older' = 'MP_AGE65',
           'flag.sixty.five.or.older' = 'F_AGE65',
           'est.seventeen.or.yonger' = 'E_AGE17',
           'estpct.seventeen.or.yonger' = 'EP_AGE17',
           'estrnk.seventeen.or.yonger' = 'EPL_AGE17',
           'moe.seventeen.or.yonger' = 'M_AGE17',
           'moepct.seventeen.or.yonger' = 'MP_AGE17',
           'flag.seventeen.or.younger' = 'F_AGE17',
           'est.disability' = 'E_DISABL',
           'estpct.disability' = 'EP_DISABL',
           'estrnk.disability' = 'EPL_DISABL',
           'moe.disability' = 'M_DISABL',
           'moepct.disability' = 'MP_DISABL',
           'flag.disability' = 'F_DISABL',
           'est.single.parent' = 'E_SNGPNT',
           'estpct.single.parent' = 'EP_SNGPNT',
           'estrnk.single.parent' = 'EPL_SNGPNT',
           'moe.single.parent' = 'M_SNGPNT',
           'moepct.single.parent' = 'MP_SNGPNT',
           'flag.single.parent' = 'F_SNGPNT',
           'est.minority' = 'E_MINRTY',
           'estpct.minority' = 'EP_MINRTY',
           'estrnk.minority' = 'EPL_MINRTY',
           'moe.minority' = 'M_MINRTY',
           'moepct.minority' = 'MP_MINRTY',
           'flag.minority' = 'F_MINRTY',
           'est.limited.english' = 'E_LIMENG',
           'estpct.limited.english' = 'EP_LIMENG',
           'estrnk.limited.english' = 'EPL_LIMENG',
           'moe.limited.english' = 'M_LIMENG',
           'moepct.limited.english' = 'MP_LIMENG',
           'flag.limited.english' = 'F_LIMENG',
           'est.high.occup.homes' = 'E_MUNIT',
           'estpct.high.occup.homes' = 'EP_MUNIT',
           'estrnk.high.occup.homes' = 'EPL_MUNIT',
           'moe.high.occup.homes' = 'M_MUNIT',
           'moepct.high.occup.homes' = 'MP_MUNIT',
           'flag.high.occup.homes' = 'F_MUNIT',
           'est.mobile.homes' = 'E_MOBILE',
           'estpct.mobile.homes' = 'EP_MOBILE',
           'estrnk.mobile.homes' = 'EPL_MOBILE',
           'moe.mobile.homes' = 'M_MOBILE',
           'moepct.mobile.homes' = 'MP_MOBILE',
           'flag.mobile.homes' = 'F_MOBILE',
           'est.crowded.homes' = 'E_CROWD',
           'estpct.crowded.homes' = 'EP_CROWD',
           'estrnk.crowded.homes' = 'EPL_CROWD',
           'moe.crowded.homes' = 'M_CROWD',
           'moepct.crowded.homes' = 'MP_CROWD',
           'flag.crowded.homes' = 'F_CROWD',
           'est.no.vehicle' = 'E_NOVEH',
           'estpct.no.vehicle' = 'EP_NOVEH',
           'estrnk.no.vehicle' = 'EPL_NOVEH',
           'moe.no.vehicle' = 'M_NOVEH',
           'moepct.no.vehicle' = 'MP_NOVEH',
           'flag.no.vehicle' = 'F_NOVEH',
           'est.group.home' = 'E_GROUPQ',
           'estpct.group.home' = 'EP_GROUPQ',
           'estrnk.group.home' = 'EPL_GROUPQ',
           'moe.group.home' = 'M_GROUPQ',
           'moepct.group.home' = 'MP_GROUPQ',
           'flag.group.home' = 'F_GROUPQ')
  
  svi_data$FIPS <- as.char(svi_data$FIPS)
  
  save(svi_data, file = SVI_RDATA_DST)
}

# SVI Documentation
if (!file.exists(SVI_DOC_DST)) download.file(SVI_DOC_SRC, SVI_DOC_DST)

# CDC SVI Shapefiles for North Carolina Counties
if (!file.exists(SHAPES_ZIP_DST)) download.file(SHAPES_ZIP_SRC, SHAPES_ZIP_DST)
unzip(SHAPES_ZIP_DST, exdir = SHAPES_PATH)

if (exists('svi_data')) rm(svi_data)