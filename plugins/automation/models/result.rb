# Copyright 2012 Outbrain, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'model'

module Automation
  class Result < App::Model::Elasticsearch
    index_name "automation_results"

    field :job_id,     :string
    field :device_id,  :string
    field :output,     :string
    field :created_at, :date,  :default => Time.now
    field :updated_at, :date,  :default => Time.now
  end
end
