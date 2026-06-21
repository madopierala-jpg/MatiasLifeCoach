-- Fix submissions policies: anon needs SELECT/DELETE (admin panel uses anon key)
DROP POLICY IF EXISTS "Authenticated users can read submissions" ON submissions;
DROP POLICY IF EXISTS "Authenticated users can delete submissions" ON submissions;

CREATE POLICY "Anyone can read submissions"
  ON submissions FOR SELECT
  TO anon
  USING (true);

CREATE POLICY "Anyone can delete submissions"
  ON submissions FOR DELETE
  TO anon
  USING (true);
