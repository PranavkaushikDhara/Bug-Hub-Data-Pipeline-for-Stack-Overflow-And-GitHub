Using extension graphql;
module default{
    type Repository {
        property name -> str;
        property stars -> int32;
        multi link has_branches := .<in_repo[is Branches];
        multi link has_releases := .<in_repo[is Releases];
        multi link has_issues := .<in_repo[is Issues];
        multi link has_contributors := .<in_repo[is Contributors];
        multi link has_labels := .<in_repo[is Labels];
	    multi link has_pulls := .<in_repo[is Pulls];
        multi link has_forks := .<in_repo[is Forks];
        multi link has_commits := .<in_repo[is Commits];
	constraint exclusive on (.name);
    }

    type Branches {
        property name -> str;
        required link in_repo -> Repository;
	constraint exclusive on (.name);
    }

    type Releases {
        property name ->str;
        required link in_repo -> Repository;
	constraint exclusive on (.name);
    }

    

    type Forks{
        property name -> str;
        property ID -> int32;
        link has_owner-> Contributors;
        required link in_repo -> Repository;
	constraint exclusive on (.name);
    }

    type Commits {
        property sha -> str;
        property author -> str;
        property committer -> str;
        link has_author -> Contributors;
        link has_committer -> Contributors;
        required link in_repo -> Repository;
	constraint exclusive on (.sha);
    }

    type Labels {
        property ID -> int64;
        property name -> str;
        required link in_repo -> Repository;
	constraint exclusive on (.ID);
    }

    type Contributors {
        property name -> str;
        property contributions -> int32;
        required link in_repo -> Repository;
	constraint exclusive on (.name);
    }
    type Pulls {
        property number -> int32;
        property state -> str;
        link has_owner -> Contributors;
        required link in_repo -> Repository;
	constraint exclusive on (.number);
    }

    type Issues {
        property number -> int32;
        property created_at -> datetime;
        property closed_at -> str;
	    property week_of_year->float64;
        required link in_repo -> Repository;
	constraint exclusive on (.number);
	
    }





    
}