module Fog
  module Google
    class StorageJSON
      class Real
        # Create an Google Storage bucket
        #
        # ==== Parameters
        # * bucket_name<~String> - name of bucket to create
        # * options<~Hash> - config arguments for bucket.  Defaults to {}.
        #   * 'LocationConstraint'<~Symbol> - sets the location for the bucket
        #   * 'x-amz-acl'<~String> - Permissions, must be in ['private', 'public-read', 'public-read-write', 'authenticated-read']
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * status<~Integer> - 200
        def put_bucket(bucket_name, options = {})
          # Create a bucket in the project
          bucket_insert_result = client.execute(
            api_method: storage_json.buckets.insert,
            parameters: { project: @project,
                          predefinedAcl: 'publicReadWrite', #options.delete("predefinedAcl"),
                          predefinedObjectAcl: 'publicReadWrite', #options.delete("predefinedObjectAcl"),
                          projection: "full" },
            body_object: { name: bucket_name }
          )
          contents = bucket_insert_result.data

          # location_constraint = options.delete("LocationConstraint")
          # storage_class = options.delete("StorageClass")
          # if location_constraint || storage_class
          #   data = "<CreateBucketConfiguration>"

          #   data += "<LocationConstraint>#{location_constraint}</LocationConstraint>" if location_constraint
          #   data += "<StorageClass>#{storage_class}</StorageClass>" if storage_class
          #   data += "</CreateBucketConfiguration>"

          # else
          #   data = nil
          # end
          # request(:expects    => 200,
          #         :body       => data,
          #         :headers    => options,
          #         :idempotent => true,
          #         :host       => "#{bucket_name}.#{@host}",
          #         :method     => "PUT")
        end
      end

      class Mock
        def put_bucket(bucket_name, options = {})
          # acl = options["x-goog-acl"] || "private"
          # if !["private", "public-read", "public-read-write", "authenticated-read"].include?(acl)
          #   raise Excon::Errors::BadRequest.new("invalid x-goog-acl")
          # else
          #   data[:acls][:bucket][bucket_name] = self.class.acls(options[acl])
          # end
          # response = Excon::Response.new
          # response.status = 200
          # bucket = {
          #   :objects        => {},
          #   "Name"          => bucket_name,
          #   "CreationDate"  => Time.now,
          #   "Owner"         => { "DisplayName" => "owner", "ID" => "some_id" },
          #   "Payer"         => "BucketOwner"
          # }
          # if options["LocationConstraint"]
          #   bucket["LocationConstraint"] = options["LocationConstraint"]
          # else
          #   bucket["LocationConstraint"] = ""
          # end
          # if data[:buckets][bucket_name].nil?
          #   data[:buckets][bucket_name] = bucket
          # else
          #   response.status = 409
          #   raise(Excon::Errors.status_error({ :expects => 200 }, response))
          # end
          # response
        end
      end
    end
  end
end
