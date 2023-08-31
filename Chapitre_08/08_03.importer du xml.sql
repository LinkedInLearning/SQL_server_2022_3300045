DECLARE @prospects XML = N'
<prospects>
<prospect Prenom="Blake" Nom="Jackson" Adresse="61 White Milton Freeway" CP="69622" Ville="St. Petersburg" Tel="786285-4047" Email="udyd13@adqqcp.net"/>
<prospect Prenom="Kirk" Nom="Kaufman" Adresse="304 South White Clarendon Drive" CP="93755" Ville="Arlington" Tel="191290-0114" Email="uadivr.luzxmmbc@dlstpd.gboreo.com"/>
<prospect Prenom="Helen" Nom="Hamilton" Adresse="56 First St." CP="52168" Ville="New York" Tel="363-8452367" Email="tijloci@twqmd.xmkrfm.org"/>
<prospect Prenom="Anita" Nom="Hardin" Adresse="628 West Rocky Milton Boulevard" CP="40678" Ville="Nashville" Tel="138065-6283" Email="hfjrjjlg597@rmpucrq.yulmsk.org"/>
<prospect Prenom="Jackie" Nom="Sutton" Adresse="35 Clarendon Road" CP="04500" Ville="Seattle" Tel="860-0698708" Email="mhwrksrd74@nxfws.uqrvff.net"/>
<prospect Prenom="Chadwick" Nom="Jennings" Adresse="862 Rocky New Parkway" CP="51548" Ville="Montgomery" Tel="4041880474" Email="thhqjy.aayrwh@ernfd.voyes-.com"/>
<prospect Prenom="Joni" Nom="Mccann" Adresse="835 Second Avenue" CP="32986" Ville="San Francisco" Tel="2926130100" Email="kqbl.thfmqjah@yunjlwwg.lzxlrc.net"/>
<prospect Prenom="Sean" Nom="Daniel" Adresse="115 West Cowley Avenue" CP="21652" Ville="New York" Tel="6251006881" Email="igvzihd.mcsxq@-fpqyn.org"/>
<prospect Prenom="Jim" Nom="Bennett" Adresse="298 White Oak Freeway" CP="77920" Ville="Virginia Beach" Tel="930-8742350" Email="kebldtys79@pxnlqfhya.uirnum.org"/>
<prospect Prenom="Elaine" Nom="Mc Intyre" Adresse="691 Cowley Parkway" CP="16667" Ville="Oklahoma" Tel="756-0794979" Email="ibth6@lqvpmd.hxsobo.net"/>
<prospect Prenom="Brock" Nom="Schroeder" Adresse="90 Old Boulevard" CP="64838" Ville="Yonkers" Tel="049-0710445" Email="fgknma.jgofzaiv@citjv.hqjlqr.com"/>
<prospect Prenom="Darla" Nom="Barr" Adresse="26 South Cowley Road" CP="29826" Ville="Jersey" Tel="599434-2325" Email="iupckgfj93@akjaml.etahql.com"/>
<prospect Prenom="Nicolas" Nom="Knight" Adresse="29 Green Nobel Boulevard" CP="24801" Ville="Corpus Christi" Tel="636-8891975" Email="lthwib.joahrga@fmmrk.fjcyzt.net"/>
<prospect Prenom="Israel" Nom="Marshall" Adresse="429 Nobel Way" CP="53363" Ville="Minneapolis" Tel="190-4588238" Email="cblaqwh21@aykdivb.hocvbj.org"/>
</prospects>
';

--SELECT p.query('.')
--FROM @prospects.nodes('/prospects/prospect') t(p)

BEGIN TRAN 

;WITH cte AS (
	SELECT 
		p.value('@Prenom',  'varchar(50)') as Prenom,
		p.value('@Nom',     'varchar(50)') as Nom,
		p.value('@Adresse', 'varchar(50)') as Adresse,
		p.value('@CP',      'varchar(10)') as CP,
		p.value('@Ville',   'varchar(20)') as Ville,
		p.value('@Tel',     'varchar(20)') as Tel,
		p.value('@Email',   'varchar(100)') as Email
	FROM @prospects.nodes('/prospects/prospect') t(p)
)
INSERT INTO PachaDataFormation.Contact.ProspectUS
	(Prenom, Nom, Adresse, CP, Ville, Tel, Email)
SELECT Prenom, Nom, Adresse, CP, Ville, Tel, Email
FROM cte;

ROLLBACK;