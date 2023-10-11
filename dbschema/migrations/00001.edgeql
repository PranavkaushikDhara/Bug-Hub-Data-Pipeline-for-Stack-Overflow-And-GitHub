CREATE MIGRATION m1jrcw7w7smnnvrsa5hcu35qquthm24n76yppjsnfpcz3esoufsgcq
    ONTO initial
{
  CREATE EXTENSION graphql VERSION '1.0';
  CREATE TYPE default::Branches {
      CREATE PROPERTY name: std::str;
      CREATE CONSTRAINT std::exclusive ON (.name);
  };
  CREATE TYPE default::Repository {
      CREATE PROPERTY name: std::str;
      CREATE CONSTRAINT std::exclusive ON (.name);
      CREATE PROPERTY stars: std::int32;
  };
  ALTER TYPE default::Branches {
      CREATE REQUIRED LINK in_repo: default::Repository;
  };
  ALTER TYPE default::Repository {
      CREATE MULTI LINK has_branches := (.<in_repo[IS default::Branches]);
  };
  CREATE TYPE default::Contributors {
      CREATE PROPERTY name: std::str;
      CREATE CONSTRAINT std::exclusive ON (.name);
      CREATE REQUIRED LINK in_repo: default::Repository;
      CREATE PROPERTY contributions: std::int32;
  };
  CREATE TYPE default::Commits {
      CREATE PROPERTY sha: std::str;
      CREATE CONSTRAINT std::exclusive ON (.sha);
      CREATE LINK has_author: default::Contributors;
      CREATE LINK has_committer: default::Contributors;
      CREATE REQUIRED LINK in_repo: default::Repository;
      CREATE PROPERTY author: std::str;
      CREATE PROPERTY committer: std::str;
  };
  ALTER TYPE default::Repository {
      CREATE MULTI LINK has_commits := (.<in_repo[IS default::Commits]);
      CREATE MULTI LINK has_contributors := (.<in_repo[IS default::Contributors]);
  };
  CREATE TYPE default::Forks {
      CREATE LINK has_owner: default::Contributors;
      CREATE PROPERTY name: std::str;
      CREATE CONSTRAINT std::exclusive ON (.name);
      CREATE REQUIRED LINK in_repo: default::Repository;
      CREATE PROPERTY ID: std::int32;
  };
  CREATE TYPE default::Pulls {
      CREATE LINK has_owner: default::Contributors;
      CREATE PROPERTY number: std::int32;
      CREATE CONSTRAINT std::exclusive ON (.number);
      CREATE REQUIRED LINK in_repo: default::Repository;
      CREATE PROPERTY state: std::str;
  };
  ALTER TYPE default::Repository {
      CREATE MULTI LINK has_forks := (.<in_repo[IS default::Forks]);
  };
  CREATE TYPE default::Issues {
      CREATE PROPERTY number: std::int32;
      CREATE CONSTRAINT std::exclusive ON (.number);
      CREATE REQUIRED LINK in_repo: default::Repository;
      CREATE PROPERTY closed_at: std::str;
      CREATE PROPERTY created_at: std::datetime;
      CREATE PROPERTY week_of_year: std::float64;
  };
  ALTER TYPE default::Repository {
      CREATE MULTI LINK has_issues := (.<in_repo[IS default::Issues]);
  };
  CREATE TYPE default::Labels {
      CREATE PROPERTY ID: std::int64;
      CREATE CONSTRAINT std::exclusive ON (.ID);
      CREATE REQUIRED LINK in_repo: default::Repository;
      CREATE PROPERTY name: std::str;
  };
  ALTER TYPE default::Repository {
      CREATE MULTI LINK has_labels := (.<in_repo[IS default::Labels]);
      CREATE MULTI LINK has_pulls := (.<in_repo[IS default::Pulls]);
  };
  CREATE TYPE default::Releases {
      CREATE PROPERTY name: std::str;
      CREATE CONSTRAINT std::exclusive ON (.name);
      CREATE REQUIRED LINK in_repo: default::Repository;
  };
  ALTER TYPE default::Repository {
      CREATE MULTI LINK has_releases := (.<in_repo[IS default::Releases]);
  };
};
