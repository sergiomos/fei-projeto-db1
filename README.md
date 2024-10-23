## Integrante
Sérgio Martins de Oliveira Santos RA: 22.222.021-2

## Modelo Entidade Relacionamento

```mermaid
erDiagram
    singers {
        int singer_id PK
        string name
        date birthday
    }

    disks {
        int disk_id PK
        string title
        date launch_date
        int singer_id FK
    }

    musics {
        int music_id PK
        string title
        int duration
        int disk_id FK
    }

    singer_music {
        int singer_id PK, FK
        int music_id PK, FK
    }


    playlists {
            int playlist_id PK
            string title
            int user_id FK
        }
    playlist_music {
            int playlist_id PK, FK
            int music_id PK, FK
        }
    users {
            int user_id PK
            string name
            string email UK
            date register_date
        }

    singers ||--o{ disks : "possui"
    disks ||--o{ musics : "contém"
    musics ||--o{ singer_music : "é interpretada por"
    singer_music ||--o{ singer_music : "interpreta"
    users ||--o{ playlist : "cria"
    playlists ||--o{ playlist_music : "contém"
    playlist_music ||--o{ playlist_music : "aparece em"
```
 

