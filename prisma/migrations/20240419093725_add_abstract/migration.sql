/*
  Warnings:

  - Made the column `content` on table `Post` required. This step will fail if there are existing NULL values in that column.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Post" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "kind" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "abstract" TEXT,
    "content" TEXT NOT NULL,
    "published" TEXT NOT NULL,
    "updated" TEXT NOT NULL
);
INSERT INTO "new_Post" ("content", "id", "kind", "published", "title", "updated") SELECT "content", "id", "kind", "published", "title", "updated" FROM "Post";
DROP TABLE "Post";
ALTER TABLE "new_Post" RENAME TO "Post";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
