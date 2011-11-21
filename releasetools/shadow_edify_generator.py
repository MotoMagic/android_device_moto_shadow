# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import sys
import os
import re

# append the build/tools/releasetools directory
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "..", "..", "build", "tools", "releasetools")))

import common
import edify_generator

class ShadowEdifyGenerator(edify_generator.EdifyGenerator):
  """Class to generate scripts in the 'edify' recovery script language
  used from donut onwards for Motorola Shadow."""

  def AssertKernelVersion(self):
    self.script.append('package_extract_file("system/etc/releaseutils/check_kernel", "/tmp/check_kernel");')
    self.script.append('set_perm(0, 0, 0777, "/tmp/check_kernel");')
    self.script.append('assert(run_program("/tmp/check_kernel") == 0);');

  def RunFormatAndTuneSystem(self):
    partition = "/system"
    self.script.append('package_extract_file("system/etc/releaseutils/mke2fs", "/tmp/mke2fs");')
    self.script.append('set_perm(0, 0, 0777, "/tmp/mke2fs");')
    self.script.append('package_extract_file("system/etc/releaseutils/tune2fs", "/tmp/tune2fs");')
    self.script.append('set_perm(0, 0, 0777, "/tmp/tune2fs");')
    self.script.append('unmount("%s");' % (partition))
    fstab = self.info.get("fstab", None)
    if fstab:
      p = fstab[partition]
      self.script.append('run_program("/tmp/mke2fs", "-g", "8184", "-m", "0", "-O", "none,has_journal,filetype", "-L", "system", "-U", "66c79d5f-31a2-42c6-86d9-9fe0d2ec3fe5", "%s");' %
                         (p.device))
      self.script.append('run_program("/tmp/tune2fs", "-c", "0", "-i", "0", "%s");' %
                         (p.device))

  def RunUpdateKernel(self):
    self.script.append('package_extract_file("system/etc/releaseutils/gb_kern-update-binary", "/tmp/gb_kern-update-binary");')
    self.script.append('set_perm(0, 0, 0777, "/tmp/gb_kern-update-binary");')
    self.script.append('package_extract_file("system/etc/releaseutils/gb_kern-update.zip", "/tmp/gb_kern-update.zip");')
    self.script.append('set_perm(0, 0, 0666, "/tmp/gb_kern-update.zip");')
    self.script.append('package_extract_file("system/etc/releaseutils/update_kernel", "/tmp/update_kernel");')
    self.script.append('set_perm(0, 0, 0777, "/tmp/update_kernel");')
    self.script.append('assert(run_program("/tmp/update_kernel") == 0);');

  def RunFinalReleaseUtils(self):
    self.script.append('package_extract_file("system/etc/releaseutils/finalize_release", "/tmp/finalize_release");')
    self.script.append('set_perm(0, 0, 0777, "/tmp/finalize_release");')
    self.script.append('run_program("/tmp/finalize_release");')


